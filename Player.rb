class Player
  #Davonda capitalized player when prompted by error message in terminal
  # Error stated " class/module name must be CONSTANT (SyntaxError)"
  attr_accessor :name, :wallet
  def initialize
    puts "Please type in your name"
    @name = gets.strip
    puts "Please type in your wallet amount"
    @wallet = gets.to_f
  end
end