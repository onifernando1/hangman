# frozen_string_literal: true

class Game
  attr_reader :word

  def initialize
    @word = ''

  end

  def random_word
    @fname = 'google-10000-english-no-swears.txt'
    
    
        @randnum = rand(1..9893)

        File.open(@fname, 'r') do |file|
        file.readlines.each_with_index do |line, idx|
            if idx == @randnum
                @word = line 
            end 
        end
        end            
    puts @word
    @word
  end

  def check_word_length
    until @word.length >=5 && @word.length <= 12 
        random_word()
    end 
  end 

  def show_hint
    @length = @word.length
    @hint = Array.new(@length, "_")
    puts @hint
  end 
end

class Player < Game
  attr_reader :p_guess, :guess

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
game.random_word()
game.check_word_length()
player = Player.new

until player.p_guess == game.word || player.guess == 0 
  player.player_guess
    game.show_hint()
end


