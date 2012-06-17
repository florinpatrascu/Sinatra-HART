require "SimpleCov"
SimpleCov.start

ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'active_record'

Dir["./lib/**/*.rb"].each { |f| require f }

Webrat.configure do |conf|
  conf.mode = :rack
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Webrat::Methods
  conf.include Webrat::Matchers
end