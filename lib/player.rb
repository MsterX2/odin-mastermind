require_relative "human_player"
require_relative "ia_player"

class Player
  def initialize
    
  end

  def human?
    puts "are you human?"
    result = gets.chomp
    result == "yes" ? HumanPlayer.new : IAPlayer.new
    @result = result
  end

end