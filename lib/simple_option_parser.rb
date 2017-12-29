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
      options[key] = parse_value(value)
      argv.shift
    end
    options
  end

  def parse_value(value)
    case value
    when %r{^[\d.]+$}
      value.to_f
    when %r{^(\d+)/(\d+)$}
      Rational($1.to_i, $2.to_i)
    when 'true', 'yes', 'on'
      true
    when 'false', 'no', 'off'
      false
    when nil
      true
    else
      value
    end
  end

end