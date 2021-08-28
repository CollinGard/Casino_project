require_relative 'player'

class Casino
  def initialize
    @player_one = Player.new
    main_choices
  end

  def main_choices
    puts "Hello #{@player_one.name}, what would you like to do?"
    puts "1. Go to the Roulette table"
    puts "2. Go to the Slots!"
    puts "3. Go to Blackjack table"
    puts "4. Go to High/Low table"
    puts "5. Show your wallet"
    puts "6. Leave the casino"
    choice = gets.to_i
    if choice == 1
      # Roulette.new(@player_one) => this will allow money to be + or - from wallet.
      # need to pass in player as an argument in initialize => def initialize(player)
    elsif choice == 2
      # Slots.new(@player_one) => this will allow money to be + or - from wallet.
      # need to pass in player as an argument in initialize => def initialize(player)
    elsif choice == 3
      # Blackjack.new(@player_one) => this will allow money to be + or - from wallet.
      # need to pass in player as an argument in initialize => def initialize(player)
    elsif choice == 4
      # HighLow.new(@player_one) => this will allow money to be + or - from wallet.
      # need to pass in player as an argument in initialize => def initialize(player)
    elsif choice == 5
      puts "You have $#{@player_one.wallet}"
    elsif choice == 6
      puts "Come back soon!"
      exit
    else
      puts "Invalid Choice, Try Again"
    end
    main_choices
  end
end

Casino.new