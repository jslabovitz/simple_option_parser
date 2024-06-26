Gem::Specification.new do |s|
  s.name          = 'simple_option_parser'
  s.version       = '0.8'
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

  s.add_dependency 'hashstruct', '~> 1.6'

  s.add_development_dependency 'minitest', '~> 5.22'
  s.add_development_dependency 'minitest-power_assert', '~> 0.3'
  s.add_development_dependency 'rake', '~> 13.2'
end