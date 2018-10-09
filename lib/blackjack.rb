def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card1 = deal_card 
  card2 = deal_card
  card_total = card1+card2
  display_card_total(card_total)
  return card_total
end

def hit?(number)
  prompt_user
  input = get_user_input
  if input == "s"
    return number
  elsif input == "h"
    card3 = deal_card
    number + card3
  else
    invalid_command
  end
end

#This method is a bit more complex. It should take in an argument of the player's current card total. So, set up your `#hit?` method to take in an argument of a number. 

#Then, the method should use the `#prompt_user` method to prompt the user for input and the `#get_user_input` method to get and store the user's input. Now we need to implement some logic. If the player's input is `'s'`, we don't deal a new card. If the player's input is `'h'`, we do need to deal a new card. In this case, use the `#deal_card` method to deal a new card and increment the player's card total by whatever number is returned by `#deal_card`. 

#If the player's input is *neither* `'h'` *nor* `'s'`, call on the `#invalid_command` method to output the phrase "Please enter a valid command". Then, call on the `#prompt_user` method again to remind your user what a valid command is.  

#In either case, our method should then return the player's current card total. 

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

#Once you get all of the tests in the first part of the test suite passing, you have built the building blocks of our blackjack game. Now, we need to put them all together in the `#runner` method. The `#runner` method is responsible for enacting the game play *until* the user loses. Remember that a player loses if the sum of their cards exceeds 21. 

#Here's how we want our game to run: 

#1. Welcome the user
#2. Deal them their first two cards, i.e. their `initial_round`
#3. Ask them if they want to hit or stay
#4. If they want to hit, deal another card
#5. If they want to stay, ask them again!
#6. If their card total exceeds 21, the game ends. 

def runner
  welcome
  initial_round
  card_total = initial_round
  until card_total > 21
  display_card_total(card_total)
  card_total = hit?(initial_round)
  end
  end_game(card_total)
end