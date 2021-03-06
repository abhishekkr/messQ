# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'messQ/version'

Gem::Specification.new do |gem|
  gem.name          = "messQ"
  gem.version       = MessQ::VERSION
  gem.authors       = ["AbhishekKr"]
  gem.email         = ["abhikumar163@gmail.com"]
  gem.description   = %q{a very simplistic queue server and agent}
  gem.summary       = %q{a very simplistic socket-based message enQueue/deQueue facility}
  gem.homepage      = "https://github.com/abhishekkr/messQ"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]


  gem.executables   = %w( messQ )

  gem.add_runtime_dependency 'arg0', '>= 0.0.2'
end
