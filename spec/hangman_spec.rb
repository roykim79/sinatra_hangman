require 'rspec'
require 'hangman'

describe Hangman do
  before :each do
    @game = Hangman.new('super')
  end

  describe '#initialize' do
    it 'sets the initial values for the game' do
      expect(@game.word().length).to be > 0
      expect(@game.guesses_left()).to eq(5)
      expect(@game.show_word()).to eq('_____')
    end
  end

  describe '#guess' do
    it 'it decrements @guesses_left with a wrong guess' do
      @game.guess('a')
      expect(@game.guesses_left()).to eq(4)
    end

    it 'replaces the _ with the guessed letter if it is part of the word' do
      @game.guess('s')
      expect(@game.guesses_left()).to eq(5)
      expect(@game.show_word()).to eq('s____')
    end
  end
end
