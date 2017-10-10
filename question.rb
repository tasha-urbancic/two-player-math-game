class Question
  
  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def generateQuestion
    "What does #{@num1} + #{@num2} equal?"
  end

  def isAnswerRight?(user_answer)
    user_answer.to_i == @num1 + @num2
  end

end