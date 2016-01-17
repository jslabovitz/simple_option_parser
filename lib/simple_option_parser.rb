class SimpleOptionParser

  attr_accessor :options
  attr_accessor :arguments

  def initialize(options={})
    @options = options
    @arguments = []
    ARGV.each do |arg|
      if arg =~ %r{^--([\w\-]+)(=(.*))?$}
        key, value = $1, $3
        key = key.gsub('-', '_').to_sym
        value = parse_value(value)
        @options[key] = value
      else
        @arguments << arg
      end
    end
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