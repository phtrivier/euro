require "src/main/dispatcher"

class CandidatePicker
  attr_accessor :candidates

  def initialize
    @candidates = { }
  end

  # Pick count candidates amoung the scores, using the
  def pick_candidates(scores, level, count, with_party = false)
    d = Dispatcher.new
    d.scores = scores
    sorted_means = d.sorted_means(level)
    res = []
    last_index_by_party = { }
    sorted_means.each_with_index do |party_and_mean, index|
      if (index >= count)
        break
      else
        party,mean = party_and_mean
        if (last_index_by_party[party] == nil)
          last_index_by_party[party] = 0
        else
          last_index_by_party[party] = last_index_by_party[party] + 1
        end
        deputy = @candidates[party][last_index_by_party[party]]
        if (deputy == nil)
          res << "unkown (#{party})"
        else
          if (with_party)
            res << "#{deputy} (#{party})"
          else
            res << deputy
          end
        end
      end
    end
    res
  end
end
