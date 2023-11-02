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
    options = {}
    while argv.first =~ %r{^--([\w\-]+)(?:=(.*))?$}
      key, value = $1, $2
      key = key.gsub('-', '_').to_sym
      value = if value.nil?
        true
      elsif options.has_key?(key)
        [options[key], value].flatten
      else
        value
      end
      options[key] = value
      argv.shift
    end
    HashStruct.new(@defaults.merge(options))
  end

end