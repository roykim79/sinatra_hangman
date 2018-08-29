require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/hangman'
require 'pry'

get '/' do
  Hangman.clear()
  erb(:start)
end

post '/play' do
  @game = Hangman.new(params.fetch('word'))
  @game.save()
  erb(:play)
end

post '/play/:id' do
  @game = Hangman.find(params[:id].to_i)
  @game.guess(params.fetch('letter'))
  erb(:play)
end
