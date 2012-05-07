# -*- encoding: utf-8 -*-
require File.expand_path('../lib/photograph/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["JH. Chabran"]
  gem.email         = ["jh@chabran.fr"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "photograph"
  gem.require_paths = ["lib"]
  gem.version       = Photograph::VERSION

  gem.add_dependency 'capybara-webkit'
  gem.add_dependency 'mini_magick'
  gem.add_dependency 'sinatra'
  gem.add_dependency 'sinatra-contrib'
end
