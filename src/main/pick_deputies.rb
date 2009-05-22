#!/usr/bin/env ruby
require "dispatcher"
require "candidate_picker"
require "euro"

def pick

  if (ARGV.size < 3)
    puts "Usage : "
    puts "pick_deputies [FOLDER_NAME] [COUNT]"
    puts "examples : pick_deputies sud_ouest 10"
    exit(-1)
  end

  folder = ARGV[1]
  count = ARGV[2].to_i

  puts "Folder : #{folder}"
  puts "Count : #{count}"

  e = Euro.new
  e.pick_from_folder(count, folder)
end



