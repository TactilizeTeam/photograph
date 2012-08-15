# -*- encoding: utf-8 -*-
require File.expand_path('../lib/photograph/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["JH. Chabran"]
  gem.email         = ["jh@chabran.fr"]
  gem.description   = %q{Webservice that screenshots any url}
  gem.summary       = %q{Webservice that screenshots any url}
  gem.homepage      = "https://github.com/TactilizeTeam/photograph"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "photograph"
  gem.require_paths = ["lib"]
  gem.version       = Photograph::VERSION

  gem.add_dependency 'poltergeist'
  gem.add_dependency 'mini_magick'
  gem.add_dependency 'sinatra'
  gem.add_dependency 'sinatra-contrib'
  gem.add_dependency 'thin'

  gem.add_development_dependency 'rspec', '~> 2.6'
end
