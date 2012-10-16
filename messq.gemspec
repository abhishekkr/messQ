# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "messq/version"

Gem::Specification.new do |s|
  s.name        = "messq"
  s.version     = MessQ::VERSION
  s.authors     = ["abhishekkr"]
  s.email       = ["abhikumar163@gmail.com"]
  s.homepage    = "http://github.com/abhishekkr/messQ"
  s.summary     = %q{A very simplistic socket-based message enQueue/deQueue facility.}
  s.description = %q{ A very simplistic socket-based message enQueue/deQueue facility. Gotta grow... }

  s.rubyforge_project = "messq"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.executables   = %w( messq qssem )
end