require_relative 'Player'

class Roulette

  def initialize(player)
    @player_one = player
  end

  def main_menu
    puts "Welcome to Roulette! "
    puts "What would you like to play?"
    puts "1. Straight up (pick only one number) - pays 35:1"
    puts "2. Back to main casino"
    user_input = gets.strip.to_i 

  case user_input
    when 1
      straight_up
    when 2  
      puts "good bye"
      exit!
    else 
      puts "Sorry, please try again"
      main_menu
    end  
  end 

  def straight_up
   puts "Welcome to straight up, please choose a number 0-36"
   my_number = gets.to_i
   puts "How much would you like to wager?"
   bet_amount = gets.to_i
   puts "you have bet on #{my_number} for $#{bet_amount}."
   sleep 3
   puts "Good luck! The wheel is now spinning"
   sleep 3
   @on_number = rand(36).to_i
   print " The ball lands on #{@on_number}!"
   my_number == @on_number ? (puts " Winner!") : (puts "  Better luck next spin!")
   my_number == @on_number ? (@player_one.wallet += bet_amount * 35) : (@player_one.wallet -= bet_amount)
  end


end