# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ahn_hoptoad/version"

Gem::Specification.new do |s|
  s.name        = "ahn_hoptoad"
  s.version     = AhnHoptoad::VERSION
  s.date        = Date.today.to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Klang"]
  s.email       = %w{bklang@mojolingo.com}
  s.homepage    = "http://github.com/mojolingo/ahn_hoptoad"
  s.summary     = %q{Send Adhearsion application exceptions to Hoptoad}
  s.description = %q{Send Adhearsion application exceptions to Hoptoad}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency("adhearsion", [">= 1.1.0"])
  s.add_runtime_dependency("toadhopper", [">= 1.3.0"])
end
