# generate two instances of a player in main file
# players will have lives and score to keep track of.

class Player
  attr_accessor :lives, :score, :my_turn, :rounds
  attr_reader :name
  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
    @my_turn = false
    @rounds = 0
  end
    
  def addScore
    self.score+=1
  end
  def loseLife
    self.lives-=1
  end
end

