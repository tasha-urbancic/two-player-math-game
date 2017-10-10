class Player
  attr_reader :id, :lives
  
  def initialize(id)
    @id = id
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def is_alive?
    @lives != 0
  end

end

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

class Game
  attr_reader :all_players, :current_player
  
  def initialize(all_players)
    @all_players = all_players
    @current_player = all_players.first
  end

  #  method to swap players
  def swap_players
    if @current_player == @all_players.first
      @current_player = @all_players.last
    else
      @current_player = @all_players.first
    end
  end

  def start_game
    while @current_player.is_alive?
      current_turn = Turn.new(@current_player)
      current_turn.runQuestion
      swap_players()
    end
    swap_players()
    if @current_player.is_alive?
      puts "Player #{@current_player.id} wins with a score of #{@current_player.lives}/3"
      puts '------- GAME OVER ---------'
      puts 'Goodbye!'
    else
      puts 'Nobody wins!'
      puts '------- GAME OVER ---------'
      puts 'Goodbye!'
    end
  end  
end

tasha = Player.new(1)
jenny = Player.new(2)
game = Game.new([tasha, jenny])
game.start_game