require_relative "game_context"
require_relative "code_maker"
require_relative "code_breaker"
require "colorize"

class Mastermind
  def initialize(game_context = GameContext.new,
                 code_maker = CodeMaker.new(game_context),
                 code_breaker = CodeBreaker.new(game_context))
    @trys = game_context.trys
    @code_maker = code_maker
    @colors = game_context.colors
    @code_breaker = code_breaker
  end

  def play
    code_maker_human?
    secret_code = pick_secret_code
    code_breaker_human?
    guesses = guess_secret_code(secret_code)
    puts choose_winner(guesses)
  end

  def code_maker_human?
    
  end

  def code_breaker_human?
    
  end

  def pick_secret_code
     @code_maker.create_secret_code(@colors)
  end

  def guess_secret_code(secret_code)
    @trys.times do
      puts "---------------------------------------------------------------------------------"
      solution = @code_breaker.get_player_guess(@colors)
      feedback = check_guess(solution, secret_code)
      return true if feedback[0] == secret_code.size
      print "Pistas: "
      print "🔴 " * feedback[0]
      print "⚪ " * feedback[1]
      puts ""
    end
    false
  end

  def check_guess(solution, secret_code)
    colors_count = secret_code.reduce(Hash.new(0)) do |color_list, color|
      color_list[color] += 1
      color_list
    end

    black_hints, white_hints = solution.zip(secret_code).reduce([0, Hash.new(0)]) do |hints, (player_guess, solution_color)|
      if player_guess == solution_color
        hints[0] +=1
        colors_count[player_guess] -= 1
        colors_count.delete(player_guess) if colors_count[player_guess] == 0
      else
        hints[1][player_guess] += 1
      end
      hints
    end

    white_hints = white_hints.reduce(0) do |hints, (color, counter)|
      if colors_count.key?(color)
        hints += [counter, colors_count[color]].min
      end

      hints
    end

    [black_hints, white_hints]
  end

  def choose_winner(guesses)
    return "code breaker wins" if guesses 
    return "code maker wins"
  end
end