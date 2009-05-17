require 'test/unit'
require "src/main/dispatcher"

class DispatcherTest < Test::Unit::TestCase

  def setup
    @d = Dispatcher.new
#    @d.scores = { :ump => 30, :ps => 20, :modem => 18, :verts => 10, :fn => 8, :npa => 6, :libertas => 5}
    @d.scores = { :ump => 30, :ps => 20, :modem => 18}
  end

  def test_compute_means
    assert_equal ["30.0","15.0",'10.0','7.5','6.0'], @d.means(5)[:ump]
    assert_equal ["20.0","10.0",'6.67','5.0','4.0'], @d.means(5)[:ps]
    assert_equal ["18.0","9.0",'6.0','4.5','3.6'], @d.means(5)[:modem]
  end

  def test_sort_means
    # I assume that in case of ex-aequos, the one with the bigger score comes first
    assert_equal [[:ump,"30.0"], [:ps, "20.0"], [:modem, "18.0"],
                   [:ump, "15.0"], [:ump, "10.0"], [:ps, "10.0"],
                   [:modem, "9.0"], [:ps, "6.67"], [:modem, "6.0"]], @d.sorted_means(3)
  end

end
