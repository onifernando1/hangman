# frozen_string_literal: true

class Start
  attr_reader :word, :hint

  def initialize
    @word = 'hey'
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

  def make_hint
    if @word.length > 3 
      @length = @word.length - 1 
      @hint = Array.new(@length, "_")
    end 
  end 

  
end

class Player
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

class Game

  def initialize(p_guess, word, hint)
    @p_guess = p_guess
    @word = word
    @hint = hint
  end



  def add_to_hint

    if @word.include?(@p_guess)
      @index =(0 ... @word.length).find_all {|i| @word[i] == "#{@p_guess}"}
        # @index = @word.index(@p_guess)
        p @index
        # @index = @index.split(",")
        @index.each do |index|
          @hint[index] = @word[index]
        end 
        p @hint
        # @hint
    end 
  end 

end 

player = Player.new
start = Start.new
start.random_word()
start.check_word_length() #not working 
start.make_hint()

until player.p_guess == start.word || player.guess == 0 
  player.player_guess()
  game = Game.new(player.p_guess, start.word, start.hint)
    game.add_to_hint()
end


