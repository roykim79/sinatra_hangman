require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/hangman'
require 'pry'

get '/' do
  erb(:start)
end

post '/play' do
  if params.fetch('word')
    @game = Hangman.new(params.fetch('word'))
  else

  end

  erb(:play)
end
