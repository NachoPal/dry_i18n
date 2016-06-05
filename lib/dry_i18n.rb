require "dry_i18n/version"
require "i18n"

module DryI18n
  I18n::Backend::Base.module_eval do
    alias_method :original_translate, :translate
    def translate(locale, key, options = {})
      result = original_translate(locale, key, options)
      nested_words = result.scan(/\@\[.*?\]/)
      translate_nested(nested_words, result, locale)
    end

    def translate_nested(nested_words, result, locale)
      nested_words.each do |nested_word|
        key = nested_word[/@\[(.*?)\]/m, 1]
        binding.pry
        begin
          key_with_options = eval(key)
          main_key = key_with_options.keys.first
          options = key_with_options[main_key]
          options_sym = {}
          options.each do |k,v|
            options_sym[k.to_sym] = v
          end
        rescue
          main_key = key
        ensure
          translated_key = original_translate(locale, main_key, options_sym ||= {})
          sub_keys = translated_key.scan(/\@\[.*?\]/)
          if sub_keys.any?
            translated_key = translate_nested(sub_keys, translated_key, locale)
          end
          result = result.sub(nested_word, translated_key)
        end
      end
      result
    end
  end
end
