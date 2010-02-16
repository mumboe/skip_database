# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{skip_database}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Bradford"]
  s.date = %q{2010-02-16}
  s.description = %q{Database skipping unility for Test::Unit and ActiveSupport::TestCase}
  s.email = %q{mbradford@mumboe.com}
  s.extra_rdoc_files = ["CHANGELOG", "README", "lib/active_support/test_case.rb", "lib/skip_database.rb", "lib/skip_database/runner.rb", "lib/test/unit/unit.rb"]
  s.files = ["CHANGELOG", "Manifest", "README", "Rakefile", "lib/active_support/test_case.rb", "lib/skip_database.rb", "lib/skip_database/runner.rb", "lib/test/unit/unit.rb", "skip_database.gemspec"]
  s.homepage = %q{http://development.mumboe.com/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Skip_database", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{skip_database}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Database skipping unility for Test::Unit and ActiveSupport::TestCase}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<active_record>, [">= 0"])
      s.add_development_dependency(%q<active_support>, [">= 0"])
      s.add_development_dependency(%q<unit_record>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<active_record>, [">= 0"])
      s.add_dependency(%q<active_support>, [">= 0"])
      s.add_dependency(%q<unit_record>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<active_record>, [">= 0"])
    s.add_dependency(%q<active_support>, [">= 0"])
    s.add_dependency(%q<unit_record>, [">= 0"])
  end
end
