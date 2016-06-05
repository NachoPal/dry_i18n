require "dry_i18n/version"
require "i18n"
module DryI18n
    I18n::Backend::Base.module_eval do
      alias_method :original_translate, :translate
      def translate(locale, key, options = {})
        result = original_translate(locale, key, options = {})
        nested_words = result.scan(/\@{.*?\}/)

        nested_words.each do |nested_word|
          if !nested_word.nil?
            word = nested_word[/@{(.*?)}/m, 1]
            translated_word = original_translate(locale, word, options = {})
            result = result.sub(nested_word, translated_word)
          end
        end
        result
      end
    end
end
