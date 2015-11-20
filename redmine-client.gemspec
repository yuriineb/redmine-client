# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine/client/version'

Gem::Specification.new do |spec|
  spec.name          = "redmine-client"
  spec.version       = Redmine::Client::VERSION
  spec.authors       = ["Andy Delcambre"]
  spec.email         = ["adelcambre@gmail.com"]

  spec.summary       = %q{A small and basic redmine client}
  spec.homepage      = "http://github.com/adelcambre/redmine-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware"
end
