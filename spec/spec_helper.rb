require 'pry'
require 'rspec'
require 'capybara/rspec'
require 'database_cleaner'

require_relative '../app.rb'

set :environment, :test

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
