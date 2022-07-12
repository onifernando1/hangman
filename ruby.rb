# frozen_string_literal: true

class Game
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

    def initialize
        @guesses = 12
        @player_guess = "AB"
    end 

    def guesses
        puts "Guesses remaining: #{@guesses}"
    end 

    def player_guess
        puts "Guess a letter"
        until @player_guess.length == 1 
            @player_guess = gets.chomp
            if @player_guess.length > 1 || @player_guess.length < 1 
                puts "INVALID"
            end 
        end  
        @guesses -= 1 
    end 

end

game = Game.new
game.random_word
player = Player.new()
player.player_guess
player.guesses