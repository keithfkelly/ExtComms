# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ExtComms/version'

Gem::Specification.new do |gem|
  gem.name          = "ExtComms"
  gem.version       = ExtComms::VERSION
  gem.authors       = ["Keith Kelly"]
  gem.email         = ["keithfrankkelly@gmail.com"]
  gem.description   = "External Communication Gem - For use with Twilio"
  gem.summary       = "Twilio Library Used to provide access to phone call and SMS Functionality - For cloud development project"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "twilio-ruby"
end
