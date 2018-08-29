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

  describe '#update_status' do
    it 'sets @game_status to "lost" when all the guesses have been used' do
      @game.guess('a')
      @game.guess('b')
      @game.guess('c')
      @game.guess('d')
      @game.guess('f')
      expect(@game.game_status()).to eq('lost')
    end

    it 'sets @game_status to "won" when the word has been guessed correctly' do
      @game.guess('s')
      @game.guess('u')
      @game.guess('p')
      @game.guess('e')
      @game.guess('r')
      expect(@game.game_status()).to eq('won')
    end
  end
end
