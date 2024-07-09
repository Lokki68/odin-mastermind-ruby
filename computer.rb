# frozen_string_literal: true

require './player'
# require './display'

class Computer < Player
  def make_code
    Array.new(4) { rand(1..4).to_s }
  end

  def input_guess
    puts "\n Guess the computer's code. You have #{@round} more guesses:"
    guess = gets.chomp.chars
    valid_input?(guess) ? guess : player_guess_again
  end

  def finish_game
    creator = 'Computer'
    solver = 'Player'
    if @solved
      p "#{solver}! You won!"
    else
      p "Sorry, #{creator} won!"
    end

    p @code.to_s
  end

  def player_guess_again
    puts "\n Invalid guess"
    state_rules
    input_guess
  end
end
