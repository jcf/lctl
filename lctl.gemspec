# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lctl/version"

Gem::Specification.new do |s|
  s.name        = "lctl"
  s.version     = Lctl::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Conroy-Finn"]
  s.email       = ["james@logi.cl"]
  s.homepage    = "http://github.com/jcf/lctl"
  s.summary     = %q{Find, load and unload launchd agents and daemons}
  s.description = %q{Find, load and unload launchd agents and daemons in your home folder}

  s.rubyforge_project = "lctl"

  s.add_dependency 'thor'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
