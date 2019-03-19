require './generate_question.rb'
require './player.rb'

game_over = false
p1 = Player.new("Player 1")
p1.my_turn = true
p2 = Player.new("Player 2")
rounds = 0

def game_check(p1,p2)
  p1.lives == 0 || p2.lives == 0 ? false : true
end

def score(p1,p2)
  "#{p1.name}: #{p1.score}/#{p1.rounds} vs #{p2.name}: #{p2.score}/#{p2.rounds} "
end

def switch_turn(p1,p2)
  p1.my_turn = p1.my_turn ? false : true
  p2.my_turn = p2.my_turn ? false : true
end

def tabulate_stats(p,outcome)
  outcome ? p.score +=1 : p.lives -= 1
end

def winner_results(p1,p2)
  winner = p1.score > p2.score ? p1 : p2
  "#{winner.name} wins with a score of #{winner.score}/#{winner.rounds} "
end

def turn(p)
  puts "----- NEW TURN -----"
  print "#{p.name}: "
  outcome = Question.new.gen_question
  puts outcome ? "YES! You are correct." : "Seriously? No!"
  tabulate_stats(p, outcome)
end


puts '----- WELCOME! ------'
while game_check(p1,p2)
  if p1.my_turn
    p1.rounds += 1 
    turn(p1)
  else
    p2.rounds += 1 
    turn(p2)
  end
  switch_turn(p1,p2)
  puts score(p1,p2)
end
puts winner_results(p1,p2)
puts "----- GAME OVER -----\n Good bye!"


# check lives for each p1 and p2... invoke loop using the outcome from this function.
# while game_check is true
  # set p1 turn value to true using switch turn.
  # invoke the turn loop.
    # take in the outcome, tabulate the stat accordingly for the player using tabulate stat
# we're out of the loop? ok, no more turns... invoke winner_results
# game over
# good bye!



