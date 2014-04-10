$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "taiwan_city/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "taiwan_city"
  s.version     = TaiwanCity::VERSION
  s.authors     = ["motephyr"]
  s.email       = ["motephyr@gmail.com"]
  s.homepage    = "https://github.com/motephyr/taiwan_city"
  s.summary     = "a gem to help you select taiwan area"
  s.description = "a gem to help you select taiwan area like city and district"
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  # s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'poltergeist'
end
