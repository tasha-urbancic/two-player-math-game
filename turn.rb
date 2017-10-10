require './question'

class Turn
  attr_reader :current_player
  
  def initialize(current_player)
    @current_player = current_player
  end

  def runQuestion
    puts '------- NEW TURN --------'
    question = Question.new
    puts "Player #{@current_player.id}: #{question.generateQuestion}"
    print '> '
    user_answer = gets.chomp
    if question.isAnswerRight?(user_answer)
      puts 'YES! You are correct.'
    else 
      @current_player.lose_life
      puts 'Seriously? No!'
    end
  end

end