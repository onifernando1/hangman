# frozen_string_literal: true

class Game
  attr_reader :word

  def random_word
    fname = 'google-10000-english-no-swears.txt'
    randnum = rand(1..9893)
    word = ''

    File.open(fname, 'r') do |file|
      file.readlines.each_with_index do |line, idx|
        word = line if idx == randnum
      end
    end

    puts word
    word
  end
end

class Player < Game
  attr_reader :player_guess, :guess

  def initialize
    @guess = 12
    @p_guess = 'AB'
  end

  def guesses
    puts "Guesses remaining: #{@guess}"
  end

  def player_guess
    puts 'Guess a letter'
    @p_guess = gets.chomp
    if @p_guess.length > 1 || @p_guess.empty?
      puts 'INVALID'
      @p_guess = gets.chomp
      guesses()
    elsif @p_guess.length == 1
      @guess -= 1
      guesses()
    end
    @p_guess
  end
end

game = Game.new
game.random_word
player = Player.new

until player.player_guess == game.word || player.guess == 0 
  player.player_guess

end


