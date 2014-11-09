require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :console do
  require 'pry'
  require 'active_command'
  ARGV.clear
  Pry.start
end

RSpec::Core::RakeTask.new

task default: :spec
task test: :spec
