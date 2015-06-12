require './app'
require "sinatra/activerecord/rake"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task :default => ['spec']
