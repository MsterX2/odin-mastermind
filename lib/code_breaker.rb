class CodeBreaker
  def initialize(game_context)
    @code_size = game_context.code_size
  end

  def get_color(colors)
    loop do
      user_selection = gets.chomp
      break user_selection if colors.include? user_selection
      p "color #{user_selection} invalid"
    end
  end

  def get_player_guess(colors)
    puts "colores disponibles"
    p colors
    Array.new(@code_size) {get_color(colors)}
  end
end