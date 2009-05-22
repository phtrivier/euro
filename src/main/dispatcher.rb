require "bigdecimal"

class Dispatcher

  attr_accessor :scores

  def initialize
    @scores = { }
    BigDecimal.mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_EVEN)
    BigDecimal.limit(20)
  end

  def means(level)
    res = { }
    @scores.each do |party,score|
      if (score >= 5)

        s = BigDecimal(score.to_s)
        res[party] = (1..level).collect do |denominator|
          d = BigDecimal(denominator.to_s)
          (s / d).round(2).to_s("f")
        end

      end
    end
    res
  end

  def sorted_means(level)

    ms = means(level)
    means_with_party = []
    ms.each do |party, all_means|
      all_means.each do |m|
        means_with_party << [party, m]
      end
    end

    means_with_party.sort do |party_and_mean1, party_and_mean2|
      party1,mean1 = party_and_mean1[0],party_and_mean1[1].to_f
      party2,mean2 = party_and_mean2[0],party_and_mean2[1].to_f
      if (mean1 < mean2)
        1
      elsif (mean1 > mean2)
        -1
      else
        if (@scores[mean1].to_f < @scores[mean2].to_f)
          1
        else
          -1
        end
      end
    end

  end

end
