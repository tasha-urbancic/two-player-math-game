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