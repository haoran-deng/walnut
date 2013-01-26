require "sinatra/activerecord"
require 'sinatra/base'

ENV["RACK_ENV"] ||= "development"
if ENV["RACK_ENV"] == 'development'
    DATABASE_URL = "sqlite:///#{$APP_ROOT}/db/malnut.db"
else
    DATABASE_URL = ENV["DATABASE_URL"]
end

# Make erb handle html.erb extention files
Tilt.register Tilt::ERBTemplate, 'html.erb'
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{$APP_ROOT}/db/walnut.db")

Dir.glob("#{$APP_ROOT}/{helpers,models,controllers}/*.rb").each { |file| require file }
