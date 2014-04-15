# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'config_file/version'

Gem::Specification.new do |spec|
  spec.name          = "config-file"
  spec.version       = ConfigFile::VERSION
  spec.authors       = ["Jessica Megan Thrower"]
  spec.email         = ["jmthrower@gmail.com"]
  spec.summary       = %q{ Easy configuration files }
  spec.description   = %q{ Easy configuration files }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5", ">= 1.5.3"
  spec.add_development_dependency "rake", "~> 10.1", ">= 10.1.1"
  spec.add_development_dependency "rspec", "~> 2.14", ">= 2.14.1"
end
