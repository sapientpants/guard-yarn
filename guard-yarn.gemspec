# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'guard/yarn/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-yarn'
  spec.version       = Guard::YarnVersion.to_s
  spec.authors       = ['Marc Tremblay']
  spec.email         = ['marc.tremblay@gmail.com']
  spec.summary       = 'Guard plugin for Yarn'
  spec.description   = 'Guard::Yarn automatically installs packages and ' \
                       'checks for vulnerrabilities with Yarn when ' \
                       'package.json is modified.'
  spec.homepage      = 'https://github.com/sapientpants/guard-yarn'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_runtime_dependency 'guard', '~> 2.0'

  spec.add_development_dependency 'bundler',       '~> 2.2.3'
  spec.add_development_dependency 'bundler-audit', '~> 0.8.0'
  spec.add_development_dependency 'guard-rspec',   '~> 4.7.3'
  spec.add_development_dependency 'guard-rubocop', '~> 1.4.0'
  spec.add_development_dependency 'rspec',         '~> 3.10'
  spec.add_development_dependency 'rubocop',       '~> 1.11'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.2.0'
end
