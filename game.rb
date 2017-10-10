require './turn'

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