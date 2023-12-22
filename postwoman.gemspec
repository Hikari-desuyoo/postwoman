Gem::Specification.new do |s|
  s.name        = 'postwoman'
  s.version     = '0.0.0'
  s.summary     = '100% CLI API platform'
  s.description = 'Make your API requests better with postwoman'
  s.authors     = ['Hikari Luz']
  s.email       = 'hikaridesuyoo@gmail.com'
  s.executables = ['postwoman']
  s.files       = Dir['utils/**/*']
  s.license     = 'GPL-3.0'
  s.add_dependency 'awesome_print'
  s.add_dependency 'byebug'
  s.add_dependency 'colorize'
  s.add_dependency 'debug'
  s.add_dependency 'faraday'
  s.add_dependency 'faraday-typhoeus'
  s.add_dependency 'i18n'
  s.add_dependency 'json'
  s.add_dependency 'nokogiri'
  s.add_dependency 'nori'
  s.add_dependency 'pry-byebug'
  s.add_dependency 'readline'
  s.add_dependency 'rspec'
  s.add_dependency 'rubocop', '~> 1.55'
  s.add_dependency 'rubycritic'
  s.add_dependency 'strscan'
  s.add_dependency 'tabelinha', '~> 1.0'
  s.add_dependency 'terminal-table'
  s.add_dependency 'yaml'
end
