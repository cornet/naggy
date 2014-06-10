# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naggy/version'

Gem::Specification.new do |spec|
  spec.name          = "naggy"
  spec.version       = Naggy::VERSION
  spec.authors       = ["cornet"]
  spec.email         = ["cornet@sheepy.org"]
  spec.description   = %q{Interface to nagios-api}
  spec.summary       = %q{Interface to nagios-api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "nagios-api-client"
  spec.add_dependency "chronic_duration"
end
