# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daily/txt/version'

Gem::Specification.new do |spec|
  spec.name          = "daily-txt"
  spec.version       = Daily::Txt::VERSION
  spec.authors       = ["bonar"]
  spec.email         = ["bonar@me.com"]

  spec.summary       = %q{command line tool for daily text file memo}
  spec.description   = %q{daily-txt is command line script for creating and listing text files wth a current date filename.}
  spec.homepage      = "https://github.com/bonar/daily-txt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["daily-txt"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
