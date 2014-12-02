# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event-log-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "event-log-sdk"
  spec.version       = EventLogSdk::VERSION
  spec.authors       = ["Yuan Ping"]
  spec.email         = ["yp.xjgz@gmail.com"]
  spec.summary       = %q{A Ruby interface to the EventLog API.}
  spec.description   = %q{A Ruby interface to the EventLog API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_runtime_dependency "activesupport"
  
  spec.add_runtime_dependency "bundler", "~> 1.7"
  spec.add_runtime_dependency "rake", "~> 10.0"
  
  spec.add_development_dependency 'minitest'
end
