class Hangman
  attr_accessor :word, :guesses_left, :show_word

  def initialize(word = "hollywood")
    @word = word
    @guesses_left = 5
    @show_word = '_' * @word.length
  end
end
