$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_notifier_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_notifier_admin"
  s.version     = UserNotifierAdmin::VERSION
  s.authors     = ["Diogo Biazus"]
  s.email       = ["diogob@gmail.com"]
  s.homepage    = "https://github.com/diogob/user_notifier_admin"
  s.summary     = "Manage notifications sent by user_notifier gem"
  s.description = "Renders all notifications templates for inspection inside a rout in your application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "user_notifier", "~> 0.1.2"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda-matchers'
end
