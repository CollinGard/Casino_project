require 'colorize'

class Slots
  def initialize(player)
    @player_one = player
    @symbols = [
      "!".colorize(:green), 
      "@".colorize(:yellow), 
      "#".colorize(:red), 
      "$".colorize(:cyan), 
      "%".colorize(:blue), 
      "&".colorize(:magenta)
    ]
    welcome
  end

  def spacer
    puts "_" * 25
    puts ""
  end

  def welcome
    spacer
    puts "WELCOME TO SLOTS!".colorize(:yellow)
    puts "_________________"
    puts "1) View Rules"
    puts "2) Play"
    puts "3) View Wallet"
    puts "4) Return To Casino"
    user_selection
  end

  def user_selection
    choice = gets.to_i
    case choice
    when 1
      rules
      welcome
    when 2
      start_game
      welcome
    when 3
      puts "You have $#{@player_one.wallet}"
      welcome
    when 4
      spacer
      puts "Goodbye!"
      exit
    end  
  end

  def rules
    spacer
    puts          "RULES".colorize(:green)
    puts "After you place your bet the slot will spin"
    puts "If you match any two symbols - You win twice your bet!"
    puts "If you match all three symbols - You win FIVE times your bet!!"
    puts "No match - You lose :("
    puts "Good Luck!!!"
  end

  def random_symbol
    @symbol1 = @symbols.sample
    @symbol2 = @symbols.sample
    @symbol3 = @symbols.sample
    @display_symbols = puts "#{@symbol1}    #{@symbol2}    #{@symbol3}"
  end

  def start_game
    spacer
    puts "Place your bet!"
    @bet = gets.to_i
    if @player_one.wallet >= @bet
      @player_one.wallet -= @bet
    else
      spacer
      puts "Go visit the ATM!  They're located by the bathrooms."
      welcome
    end
    spacer
    puts "Good Luck!!!"
    sleep 2
    spacer
    random_symbol
    sleep 2
    determine_winnings
  end

  def multiplier(sym1, sym2, sym3)
    if sym1==sym2 && sym2==sym3
      return 3
    elsif sym1==sym2 || sym2==sym3 || sym1==sym3
      return 2
    else
      return 0
    end
  end

  def determine_winnings
    spacer
    winnings = @bet * multiplier(@symbol1, @symbol2, @symbol3)
    if winnings > 0
      puts "You have won $#{winnings}!!!".colorize(:green)
      @player_one.wallet += winnings
    else
      puts "You have lost".colorize(:red)
    end
    welcome
  end
 
end