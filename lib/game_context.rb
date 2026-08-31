class GameContext
  attr_reader :colors, :code_size, :trys
  COLORS = ["red", "blue", "yellow", "green", "black"]
  def initialize(colors = COLORS, code_size = 5, trys = 12)
    @colors = colors
    @code_size = code_size
    @trys = trys
  end
end