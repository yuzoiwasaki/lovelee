# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lovelee/version'

Gem::Specification.new do |spec|
  spec.name          = "lovelee"
  spec.version       = Lovelee::VERSION
  spec.authors       = ["yuzoiwasaki"]
  spec.email         = ["a0556017@sophia.jp"]

  spec.summary       = %q{Get GitHub follow/followed relation list}
  spec.description   = %q{Get GitHub follow/followed relation list}
  spec.homepage      = "https://github.com/yuzoiwasaki/lovelee"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
