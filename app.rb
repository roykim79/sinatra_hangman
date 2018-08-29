require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/hangman'
require 'pry'

get '/' do
  erb(:start)
end
