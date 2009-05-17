require "test/unit"
require "src/main/candidate_picker"

class CandidatePickerTest < Test::Unit::TestCase

  def setup
    @c = CandidatePicker.new
    @c.candidates = { :ump => ["ump1", "ump2", "ump3", "ump4", "ump5"],
      :ps => ["ps1", "ps2", "ps3", "ps4"],
      :modem => ["modem1", "modem2", "modem3", "modem4"]
    }
  end

  def test_pick_candidates
    scores = { :ump => 30, :ps => 20, :modem => 18}
    deputies = @c.pick_candidates(scores,3,9)
    assert_equal 9, deputies.size
    assert_equal ["ump1", "ps1", "modem1", "ump2", "ump3", "ps2", "modem2", "ps3", "modem3"], deputies
  end

end
