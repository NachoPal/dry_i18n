require "dry_i18n/version"
require "i18n"

module DryI18n
  I18n::Backend::Base.module_eval do
    alias_method :original_translate, :translate

    def translate(locale, key, options = {})
      translation = original_translate(locale, key, options)
      variables = variables?(translation)

      if variables
        variables.each do |variable|
          key = variable[/@\[(.*?)\]/m, 1]
          options = key.scan(/\{.*?\}/)
          if options.any?
            options = eval(options.first)
            key = key.split(',').first
          else
            options = {}
          end
          translation = translation.sub(variable, I18n.translate(key, options))
        end
      end
      translation
    end

    private

      def variables?(translation)
        nested_words = translation.scan(/\@\[.*?\]/)
        if !nested_words.any?
          false
        else
          nested_words
        end
      end
  end
end
