(in /www/projects/alphadecimal)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{alphadecimal}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Mondragon", "Jack Danger Canty"]
  s.date = %q{2009-03-19}
  s.default_executable = %q{alphadecimal}
  s.description = %q{Convert integers to base62 strings (A-Za-z0-9) and back.  A handy way to shorten long numbers.}
  s.email = ["mikemondragon@gmail.com", "rubygems@6brand.com"]
  s.executables = ["alphadecimal"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "alphadecimal.gemspec", "bin/alphadecimal", "init.rb", "lib/alphadecimal.rb", "rails/init.rb", "test/test_alphadecimal.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/JackDanger/alphadecimal}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{alphadecimal}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Convert integers to base62 strings (A-Za-z0-9) and back}
  s.test_files = ["test/test_alphadecimal.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.11.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.11.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.11.0"])
  end
end
