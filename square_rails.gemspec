# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'square_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "square_rails"
  spec.version       = SquareRails::VERSION
  spec.authors       = ["Quinn McLaughlin"]
  spec.email         = ["quinn@coincidence.net"]

  spec.summary       = %q{Gem to simplify getting started with the Square Connect API.}
  spec.description   = %q{This gem provides a convenient way for a developer to quickly get to a merchant's data  Add your app ID and secret, update your callback location in the Square Developer Portal and off you go. Based on Square's sinatra examples, https://github.com/square/connect-api-examples}
  spec.homepage      = "https://github.com/qmclaugh/square_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_dependency "unirest"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.has_rdoc      = false
end
