require 'minitest/autorun'
require 'lovelee'
MiniTest.autorun

class TestLovelee < MiniTest::Test
  def setup
    $stdout, @orig_stdout =
      open("/dev/null", 'w'), $stdout
    @foo = Lovelee.new("yuzoiwasaki")
    @bar = Lovelee.new("yuzoiwasak1")
    @baz = Lovelee.new
  end

  def teardown
    $stdout = @orig_stdout
  end

  def test_foo_loves
    @lovers = @foo.loves
    assert @lovers.is_a?(Array)
  end

  def test_foo_loved_by
    @lovers = @foo.loved_by
    assert @lovers.is_a?(Array)
  end

  def test_bar_loves
    @lovers = @bar.loves
    assert_nil @lovers
  end

  def test_bar_loved_by
    @lovers = @bar.loved_by
    assert_nil @lovers
  end

  def test_baz_loves
    @lovers = @baz.loves
    assert_nil @lovers
  end

  def test_baz_loved_by
    @lovers = @baz.loved_by
    assert_nil @lovers
  end
end
