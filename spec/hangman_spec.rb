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
end
