require "src/main/dispatcher"

class CandidatePicker
  attr_accessor :candidates

  def initialize
    @candidates = { }
  end

  # Pick count candidates amoung the scores, using the
  def pick_candidates(scores, level, count)
    d = Dispatcher.new
    d.scores = scores
    sorted_means = d.sorted_means(level)
    res = []
    last_index_by_party = { }
    sorted_means.each_with_index do |party_and_mean, index|
      party,mean = party_and_mean
      if (last_index_by_party[party] == nil)
        last_index_by_party[party] = 0
      else
        last_index_by_party[party] = last_index_by_party[party] + 1
      end
      res << @candidates[party][last_index_by_party[party]]
    end
    res
  end
end
