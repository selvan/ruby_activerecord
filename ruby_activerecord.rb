require "rubygems"
require "bundler/setup"
require "logger"

require "active_record"
require "yaml"

ActiveRecord::Base.configurations = YAML::load(IO.read("#{File.dirname(__FILE__)}/config/databases.yml"))

environment = ENV["environment"] || "development"
ActiveRecord::Base.establish_connection(environment)
ActiveRecord::Base.logger = Logger.new(STDERR) if environment == "development"

require "model/product"

