require_relative 'Player.rb'
# require_relative 'casino.rb'

class High_Low


    def initialize (player)
      @player_one = player
      highlow_menu
    end
  
    def highlow_menu
      puts "Welcome to High-Low, #{@player_one.name}!"
      puts "What would you like to do?"
      puts "1) See High-Low rules."
      puts "2) See current wallet."
      puts "3) Play High-Low."
      @guesses= 5
       # to set the amount of user guesses
      puts "4) Exit High-Low. Return to casino lobby." 
      @user_input = gets.strip.to_i
    
      case @user_input

         when 1
                highlow_rules
        when 2
                see_wallet
          
        when 3
                begin_highlow
              
        when 4
                casino_menu
               
        else
          puts "Please select one of the menu number options."
            highlow_menu
        end
     
    end
     
  
  def highlow_rules
    puts "Guess the correct number within five attempts or less and double your bet!" 
    puts "The correct number will be between 1-50."
    highlow_menu
  end

  def see_wallet
    puts "You have $#{@player_one.wallet}0 in your account."
    highlow_menu
  end

  def begin_highlow
    puts "Ready to play? How much would you like to bet?"
    @bet = gets.strip.to_i
    if @player_one.wallet >= @bet
       @player_one.wallet -= @bet
       generate_number
    
    else @player_one.wallet < bet
      puts "Insufficient funds. Try a lower bet or add more money to your account!"
      highlow_menu
    end
  end

   def generate_number
    @num = rand (51).to_i
    play_game
  end

    def play_game
     
      if @guesses > 0

        puts "Guess a number between 0 and 50"
          user_answer = gets.strip.to_i

        if user_answer == @num
          puts "Correct. You did it!"
          show_winnings
        
        elsif user_answer > @num
          @guesses -=1
          puts "Please try again. You have #{ @guesses } guesses left. Guess lower."
          play_game
        
        elsif user_answer < @num
          @guesses -= 1
          puts "Please try again. You have #{@guesses} guesses left. Guess higher."
          play_game
      
        end
      else
        puts "Game over!"
        highlow_menu
      end
    end

    def show_winnings
      @winnings = @bet * 2
      puts "Congratulations! You have added $#{@winnings} to your bank!"
      if @winnings > 0
        @player_one.wallet += @winnings
      highlow_menu
      end
    end
end
P = Player.new
H = High_Low.new(P)

  


  