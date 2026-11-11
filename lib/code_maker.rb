class CodeMaker
  def initialize(game_context)
    @code_size = game_context.code_size
  end

  def create_secret_code(colors)
    Array.new(@code_size) {colors.sample}
  end
end