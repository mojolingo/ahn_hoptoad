GEM_FILES = %w{
  ahn_hoptoad.gemspec
  lib/ahn_hoptoad.rb
  config/ahn_hoptoad.yml
}

Gem::Specification.new do |s|
  s.name = "ahn_hoptoad"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Your Name Here!"]

  s.date = Date.today.to_s
  s.description = "Send Adhearsion application exceptions to Hoptoad"
  s.email = "dev@adhearsion.com"

  s.files = GEM_FILES

  s.has_rdoc = false
  s.homepage = "http://adhearsion.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.2.0"
  s.summary = "Send Adhearsion application exceptions to Hoptoad"

  s.specification_version = 2

  s.add_runtime_dependency("adhearsion", [">= 1.1.0"])
  s.add_runtime_dependency("toadhopper", [">= 1.2.0"])
end
