require_relative "game_context"
require_relative "code_maker"
require_relative "code_breaker"
require "colorize"

class Mastermind
  def initialize(game_context = GameContext.new,
                 code_maker = CodeMaker.new(game_context.colors, game_context.code_size),
                 code_breaker = CodeBreaker.new(game_context.colors, game_context.trys))
    @trys = 2 #game_context.trys
    @colors = game_context.colors
    @code_maker = code_maker
    @code_breaker = code_breaker
  end

  def play
    secret_code = pick_secret_code
    puts "este es el codigo secreto"
    p secret_code
    guesses = guess_secret_code(secret_code)
    puts choose_winner(guesses)
  end

  def pick_secret_code
     @code_maker.create_secret_code
  end

  def guess_secret_code(secret_code)
    colors_count = solution.reduce(Hash.new(0)) do |color_list, color|
      color_list[color] += 1
      color_list
    end
    @trys.times do
      solution = @code_breaker.get_player_guess(secret_code)
      feedback = check_guess(solution, secret_code, colors_count)
      return true if feedback[0] == secret_code.size
    end
    false
  end

  def check_guess(solution, secret_code, colors_count)
    solution.zip(secret_code).reduce(Array.new(2) {0}) do |hints, (player_guess, solution_color)|
      if player_guess == solution_color
        hints[0] +=1
      elsif colors_count.key?(player_guess)
        hints[1] += 1
        colors_count[player_guess] -= 1
        colors_count.delete(player_guess) if colors_count[player_guess] == 0
      end

      hints
    end
  end

  def choose_winner(guesses)
    return "code breaker wins" if guesses 
    return "code maker wins"
  end
end