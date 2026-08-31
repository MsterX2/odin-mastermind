class CodeMaker
  def initialize(colors, code_size)
    @colors = colors
    @code_size = code_size
  end

  def create_secret_code
    Array.new(@code_size) {@colors.sample}
  end
end