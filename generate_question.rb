class Question
  attr_reader :num1, :num2

  def initialize
    @num1 = (rand(1...21))
    @num2 = (rand(1...21))
  end
  def gen_question
    puts "What does #{num1} plus #{num2} equal?"
    print '> '
    guess = gets.chomp
    check_answer(guess)
  end
  def check_answer(guess)
    answer = (self.num1 + self.num2)
    return guess.to_i == answer
  end

end

