# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "liquid-mj"
  spec.version       = "1.0.0"
  spec.authors       = ["Thai Chung"]
  spec.email         = ["mail@0xReki.de"]
  spec.summary       = "Adds sha2 filters to Liquid."
  spec.homepage      = "https://github.com/0xReki/liquid-mj"
  spec.licenses      = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")

  spec.add_runtime_dependency "liquid", ">= 2.5", "< 5.0"
end
