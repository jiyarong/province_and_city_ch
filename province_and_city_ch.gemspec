$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "province_and_city_ch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "province_and_city_ch"
  s.version     = ProvinceAndCityCh::VERSION
  s.authors     = ["纪亚荣"]
  s.email       = ["583255925@qq.com"]
  s.homepage    = "http://blog.csdn.net/yangcs2009/article/details/42262073"
  s.summary     = "Summary of ProvinceAndCityCh."
  s.description = "Description of ProvinceAndCityCh."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
