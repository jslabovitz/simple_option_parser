require 'minitest'
require 'minitest/autorun'
require 'minitest-power_assert'

require 'simple_option_parser'

class SimpleOptionParser

  class Test < Minitest::Test

    def test_new_then_parse
      op = SimpleOptionParser.new
      argv = %w{--foo blah}
      options = op.parse(argv)
      assert {
        options == { foo: true }
      }
      assert {
        argv == ['blah']
      }
    end

    def test_direct_parse
      argv = %w{--foo blah}
      options = SimpleOptionParser.parse(argv, foo: true)
      assert {
        options == { foo: true }
      }
      assert {
        argv == ['blah']
      }
    end

    def test_values
      op = SimpleOptionParser.new
      argv = %w{--foo --bar=xyz --zot=false --blargh=1.0 --grotz=5}
      options = op.parse(argv)
      assert {
        options == { foo: true, bar: 'xyz', zot: false, blargh: 1.0, grotz: 5 }
      }
    end

    def test_defaults
      op = SimpleOptionParser.new(foo: 'def', bar: 'ghi')
      argv = %w{--foo=abc}
      options = op.parse(argv)
      assert {
        options == { foo: 'abc', bar: 'ghi' }
      }
    end

  end

end