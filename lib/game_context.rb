class GameContext
  attr_reader :colors, :code_size, :trys
  COLORS = ["red", "blue", "yellow", "green", "black", "purple"]
  def initialize(colors = COLORS, code_size = 4, trys = 10)
    @colors = colors
    @code_size = code_size
    @trys = trys
  end
end