class Hangman
  attr_accessor :word, :guesses_left, :show_word, :game_status

  def initialize(word)
    @word = word
    @guesses_left = 5
    @show_word = '_' * @word.length
    @game_status = 'going'
  end

  def guess(letter)
    if @word.include?(letter)
      @word.chars.each_with_index do |char, index|
        if char == letter
          @show_word[index] = letter
        end
      end
    else
      @guesses_left -= 1
    end
    update_status()
  end

  def update_status()
    if (@guesses_left < 1)
      @game_status = 'lost'
    elsif @word == @show_word
      @game_status = 'won'
    end
  end
end
