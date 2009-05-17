class Euro

  attr_reader :candidates,:scores

  def initialize
    @candidates = { }
    @scores = { }
  end

  def read_candidates(name, str)
    @candidates[name]=[]
    str.each_line do |line|
      @candidates[name]<< line.strip
    end
  end

  def read_scores(str)
    @scores = { }
    str.each_line do |line|
      tokens = line.strip.split(" ")
      party = tokens[0].to_sym
      score = tokens[1].to_f
      @scores[party] = score
    end
  end

  def pick_deputies
    TODO
  end

end
