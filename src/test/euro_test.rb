require "test/unit"
require "src/main/candidate_picker"
require "src/main/euro"

class EuroTest < Test::Unit::TestCase

  def test_reads_euro_candidates
    e = Euro.new
    ump = <<EOF
ump1
ump2
ump3
EOF

    ps = <<EOF
ps1
ps2
ps3
EOF
    e.read_candidates(:ump, ump)
    e.read_candidates(:ps, ps)

    assert_equal ["ump1", "ump2", "ump3"], e.candidates[:ump]
  end

  def test_read_score
    e = Euro.new
    scores = <<EOF
ump 28
ps 15
modem 12
EOF
    e.read_scores(scores)
    assert_equal 28.0, e.scores[:ump]
    assert_equal 15.0, e.scores[:ps]
  end

  def test_pick_candidates
    scores = <<EOF
ump 30
ps 20
modem 18
EOF
    ump = <<EOF
ump1
ump2
ump3
ump4
EOF

    ps = <<EOF
ps1
ps2
ps3
ps4
EOF
    modem = <<EOF
modem1
modem2
modem3
EOF

    e = Euro.new
    e.read_candidates(:ump, ump)
    e.read_candidates(:ps, ps)
    e.read_candidates(:modem, modem)

    e.read_scores(scores)
    deputies = e.pick_deputies(9)

    assert_equal ["ump1", "ps1", "modem1", "ump2", "ump3", "ps2", "modem2", "ps3", "modem3"], deputies

  end

end
