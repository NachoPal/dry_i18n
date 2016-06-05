# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dry_i18n/version'

Gem::Specification.new do |spec|
  spec.name          = "dry_i18n"
  spec.version       = DryI18n::VERSION
  spec.authors       = ["Nacho"]
  spec.email         = ["ignacio.palacios.santos@gmail.com"]

  spec.summary       = %q{Avoid repeating word translations for I18n ruby gem}
  spec.description   = %q{Don't repeat yourself translating over and over common words you use for your project.
                          Translate them once, and then you'll be able to reuse them directly on the I18n yml file}

  spec.homepage      = "https://github.com/NachoPal/dry_i18n"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
