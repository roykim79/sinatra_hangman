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
      @game.guess('u')
      expect(@game.guesses_left()).to eq(5)
      expect(@game.show_word()).to eq('su___')
    end
  end

  describe '#game_status' do
    it 'sets @game_going to false when all the guesses have been used' do
      @game.guess('a')
      @game.guess('b')
      @game.guess('c')
      @game.guess('d')
      @game.guess('f')
      expect(@game.game_going()).to eq(false)
    end

    it 'sets @game_going to false when the word have been fully guessed correctly' do
      @game.guess('s')
      @game.guess('u')
      @game.guess('p')
      @game.guess('e')
      @game.guess('r')
      expect(@game.game_going()).to eq(false)
    end
  end
end
