# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'humidifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'humidifier'
  spec.version       = Humidifier::VERSION
  spec.authors       = ['Localytics']
  spec.email         = ['oss@localytics.com']

  spec.summary       = 'CloudFormation made easy'
  spec.description   = 'Programmatically generate and manage AWS ' \
                       'CloudFormation templates, stacks, and change sets.'
  spec.homepage      = 'https://github.com/localytics/humidifier'
  spec.license       = 'MIT'

  spec.files         = Dir['LICENSE', 'README.md', 'lib/**/*',
                           'CloudFormationResourceSpecification.json']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.1'

  spec.add_development_dependency 'bundler', '>= 1.16'
  spec.add_development_dependency 'minitest', '~> 5.11'
  spec.add_development_dependency 'nokogiri', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rubocop', '~> 0.60'
  spec.add_development_dependency 'simplecov', '~> 0.16'
  spec.add_development_dependency 'yard', '~> 0.9'
end
