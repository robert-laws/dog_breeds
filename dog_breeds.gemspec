require_relative './lib/dog_breeds/version'

Gem::Specification.new do |s|
  s.name        = 'dog-breeds'
  s.version     = DogBreeds::VERSION
  s.date        = '2017-09-23'
  s.summary     = "Explore Dog Breeds"
  s.description = "Find names of dog breeds and read detailed information about each breed."
  s.authors     = ["Robert Laws"]
  s.email       = 'roblaws@me.com'
  s.files       = ["lib/dog_breeds.rb", "lib/dog_breeds/cli.rb", "lib/dog_breeds/scrape.rb", "lib/dog_breeds/dog.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/dog-breeds'
  s.license     = 'MIT'
  s.executables << 'dog-breeds'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end