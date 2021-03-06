# encoding:utf-8
Gem::Specification.new do |s|
  s.name        = 'elasticsearch_rasi'
  s.version     = '0.2.0'
  s.date        = '2015-02-09'
  s.summary     = "ElasticSearch for Rasi"
  s.description = "Post and mentions elasticsearch"
  s.authors     = ["Tomas Hrabal"]
  s.email       = 'hrabal.tomas@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license     = 'MIT'

  s.add_dependency 'elasticsearch', '0.4'
  s.add_dependency 'typhoeus', '~> 0.7'
  s.add_dependency 'oj', '~> 2.11'
  s.add_dependency 'activesupport'
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
end
