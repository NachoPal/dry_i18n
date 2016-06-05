require "dry_i18n/version"
require 'i18n'
module DryI18n
  class Test
    def translate word
      puts I18n.t(word)
    end
  end
  # Your code goes here...
end
