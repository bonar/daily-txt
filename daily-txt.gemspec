# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daily/txt/version'

Gem::Specification.new do |spec|
  spec.name          = "daily-txt"
  spec.version       = Daily::Txt::VERSION
  spec.authors       = ["bonar"]
  spec.email         = ["bonar@me.com"]

  spec.summary       = %q{command line tool for today's markdown memo}
  spec.description   = %q{daily-md is command line script for creating and listing markdown text files that has a filename with current date.}
  spec.homepage      = "http://bonar.jp/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["daily-txt"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
