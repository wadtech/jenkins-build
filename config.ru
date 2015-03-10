require 'rubygems'
require 'sinatra'

log = File.new('logs/application.log','a')
$stdout.reopen(log)
$stderr.reopen(log)

set :environment, ENV['RACK_ENV'].to_sym
disable :run, :reload

require 'server.rb'

run Sinatra::Application
