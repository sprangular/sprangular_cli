# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprangular_cmd/version'

Gem::Specification.new do |spec|
  spec.name          = "sprangular_cmd"
  spec.version       = SprangularCmd::VERSION
  spec.authors       = ["Josh Nussbaum"]
  spec.email         = ["joshnuss@gmail.com"]
  spec.description   = %q{Create sprangular extensions}
  spec.summary       = %q{Tool for creating sprangular extensions}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
