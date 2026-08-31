class CodeBreaker
  def initialize(colors, code_size)
    @colors = colors
    @code_size = code_size
  end

  def player_tray
    loop do
      puts "colores disponibles"
      p @colors
      user_selection = gets.chomp
      break user_selection if @colors.include? user_selection
    end
  end

  def get_player_guess(secret_code)
    secret_code.map do |color|
      player_tray
    end
  end
end