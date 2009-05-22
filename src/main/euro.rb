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

  def pick_deputies(number, with_party=false)
    picker = CandidatePicker.new
    picker.candidates = @candidates
    picker.pick_candidates(@scores, number, number, with_party)
  end

  def pick_from_folder(count, folder_name)

    # Read all candidates from the folder
    Dir["#{folder_name}/candidates/*"].each do |filename|
      puts "Reading candidates #{filename}"
      read_candidates(File.basename(filename).to_sym, File.open(filename).read)
    end

    read_scores(File.open("#{folder_name}/scores").read)
    deputies = pick_deputies(count, true)
    puts "Elected candidates : "
    deputies.each_with_index do |d, i|
      puts "#{i+1} - #{d}"
    end

  end

end
