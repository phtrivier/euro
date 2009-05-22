require 'rake'
require 'rake/testtask'
require 'fileutils'

# ----------------
# Running

task :default => [:test]

desc "Run core tests"
Rake::TestTask.new("test") do |t|
  t.libs.push("./src/test")
  t.pattern = 'src/test/*_test.rb'
  t.verbose = false
  t.warning = false
end

desc "Pick"
task :pick => [:test] do
  $LOAD_PATH << "./src/main"
  require "pick_deputies.rb"
  pick
end
