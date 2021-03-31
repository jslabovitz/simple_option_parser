require 'hashstruct'

class SimpleOptionParser

  attr_accessor :defaults

  def self.parse(argv, defaults={})
    new(defaults).parse(argv)
  end

  def initialize(defaults={})
    @defaults = defaults
  end

  def parse(argv)
    options = @defaults.dup
    while argv.first =~ %r{^--([\w\-]+)(?:=(.*))?$}
      key, value = $1, $2
      key = key.gsub('-', '_').to_sym
      value = true if value.nil?
      options[key] = value
      argv.shift
    end
    HashStruct.new(options)
  end

end