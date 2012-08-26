# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Jason Coene"]
  gem.email         = ["jcoene@gmail.com"]
  gem.description   = %q{Automatically decorates your resourceful controller}
  gem.summary       = %q{Automatically decorates your resourceful controller}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "decorate_resource"
  gem.require_paths = ["lib"]
  gem.version       = "1.0.0"
end
