class CodeBreaker
  def initialize(colors, code_size)
    @colors = colors
    @code_size = code_size
  end

  def player_tray
    loop do
      user_selection = gets.chomp
      break user_selection if @colors.include? user_selection
      p "color #{user_selection} invalid"
    end
  end

  def get_player_guess
    puts "colores disponibles"
    p @colors
    Array.new(@code_size) {player_tray}
  end
end