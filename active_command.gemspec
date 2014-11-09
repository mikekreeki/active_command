# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_command/version'

Gem::Specification.new do |spec|
  spec.name          = "active_command"
  spec.version       = ActiveCommand::VERSION
  spec.authors       = ["Michal Krej\xC4\x8D\xC3\xAD"]
  spec.email         = ["mikekreeki@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'virtus', '~> 1.0.3'
  spec.add_dependency 'virtus-group', '~> 0.3.0'
  spec.add_dependency 'concurrent-ruby', '~> 0.7.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency 'rspec-virtus'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'
end
