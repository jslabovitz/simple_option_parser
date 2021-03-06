require_relative 'lib/simple_option_parser/version'

Gem::Specification.new do |s|
  s.name          = 'simple_option_parser'
  s.version       = SimpleOptionParser::VERSION
  s.summary       = 'A very simple option parser for ARGV.'
  s.author        = 'John Labovitz'
  s.email         = 'johnl@johnlabovitz.com'
  s.description   = %q{
    A very simple option parser for ARGV.
  }
  s.homepage      = 'http://github.com/jslabovitz/simple_option_parser'
  s.license       = 'MIT'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path  = 'lib'

  s.add_development_dependency 'minitest', '~> 0'
  s.add_development_dependency 'minitest-power_assert', '~> 0'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rubygems-tasks', '~> 0'
end