$:.push File.expand_path("lib", __dir__)

require "has_secure_whatever/version"

Gem::Specification.new do |s|
  s.name        = "has_secure_whatever"
  s.version     = HasSecureWhatever::VERSION
  s.authors     = ["Arandi Lopez"]
  s.email       = ["arandilopez.93@gmail.com"]
  s.homepage    = "https://github.com/arandilopez/has_secure_whatever"
  s.summary     = "Add secure encrypted fields to protect sensitive information in database"
  s.description = "Add secure encrypted fields to protect sensitive information in database"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
