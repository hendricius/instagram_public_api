# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'instagram_public_api/version'

Gem::Specification.new do |spec|
  spec.name          = "instagram_public_api"
  spec.version       = InstagramPublicApi::VERSION
  spec.authors       = ["Hendrik Kleinwaechter"]
  spec.email         = ["hendrik.kleinwaechter@gmail.com"]

  spec.summary       = %q{Client for the public Instagram API}
  spec.description   = %q{A client/scraper for the public Instagram API.}
  spec.homepage      = "https://github.com/hendricius/instagram_public_api"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency(%q<faraday>,       ["~> 0.8"])
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "virtus"
end
