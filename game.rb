class Game
  attr_accessor :turn, :player, :player2

  def initialize
    @turn = 1
    @player1 = 3
    @player2 = 3
  end

end

def game_over
  puts "Player 1: #{@player1}/3 lives. Player 2: #{@player2}/3 lives."
  puts "------ GAME OVER ------"
  puts "Goodbye!"
  exit(0)
end

def update_lives(turn)
  if turn == 1
    @player1 -= 1
  else 
    @player2 -= 1
  end
  if @player1 == 0 || @player2 == 0
    game_over
  end
end

def update_turn(turn)
  if turn == 1
    @turn = 2
  else
    @turn = 1
  end
  start
end

def start
  puts "Player 1: #{@player1}/3 lives. Player 2: #{@player2}/3 lives."
  # create_players
  question = Question.new(turn)
  if !question.start
    update_lives(turn)
  end
  update_turn(turn)
end

end