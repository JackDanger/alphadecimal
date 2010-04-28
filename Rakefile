begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "alphadecimal"
    gem.summary = %Q{Convert integers to base62 strings (A-Za-z0-9) and back.  A handy way to shorten long numbers.}
    gem.description = %Q{Convert integers to base62 strings (A-Za-z0-9) and back. Ideal for url shorteners like Shawty-server.}
    gem.email = "rubygems@6brand.com"
    gem.homepage = "http://github.com/JackDanger/alphadecimal"
    gem.authors = ["Mike Mondragon", "Jack Danger Canty"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end



task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << '.'
  test.pattern = 'test/test_*.rb'
  test.verbose = true
end
