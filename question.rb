require 'timeout'

class Question
  attr_accessor :turn, :player1_score, :player2_score

  def initialize(turn)
    @turn = turn
    @player1_score = 0
    @player2_score = 0
  end

  def start
    num1 = rand(1..10)
    num2 = rand(1..10)

    puts "----- NEW TURN -----"
    puts "Player #{turn}: What is #{num1} * #{num2}?"
    print "> "

    answer = nil
    begin
      Timeout::timeout(5) do
        answer = $stdin.gets.chomp.to_i
      end
    rescue Timeout::Error
      puts "Time's up!"
      return false
    end

    if answer == num1 * num2
      puts "Correct!"
      if turn == 1
        @player1_score += 1
      else
        @player2_score += 1
      end
      return true
    else 
      puts "Incorrect!"
      if turn == 1
        @player1_score -= 1
      else
        @player2_score -= 1
      end
      return false
    end
  end

  def winner
    if player1_score > player2_score
      puts "Player 1 wins with a score of #{player1_score}!"
    elsif player2_score > player1_score
      puts "Player 2 wins with a score of #{player2_score}!"
    else
      puts "It's a tie!"
    end
  end
end




























# require 'timeout'

# class Question
#   attr_accessor :turn

#   def initialize(turn)
#     @turn = turn
#   end

#   def start
#     num1 = rand(1..10)
#     num2 = rand(1..10)

#     puts "----- NEW TURN -----"
#     puts "Player #{turn}: What is #{num1} * #{num2}?"
#     print "> "

#     answer = nil
#     begin
#       Timeout::timeout(5) do
#         answer = $stdin.gets.chomp.to_i
#       end
#     rescue Timeout::Error
#       puts "Time's up!"
#       return false
#     end

#     if answer == num1 * num2
#       puts "Correct!"
#       return true
#     else 
#       puts "Incorrect!"
#       return false
#     end
#   end
# end






























# class Question
#   attr_accessor :turn

#   def initialize(turn)
#     @turn = turn
#   end

#   def start
#     num1 = rand(1..10)
#     num2 = rand(1..10)

#     puts "----- NEW TURN -----"
#     puts "Player #{turn}: What is #{num1} * #{num2}?"
#     print "> "

#     answer = $stdin.gets.chomp.to_i

#     if answer == num1 * num2
#       puts "Correct!"
#       return true
#     else 
#       puts "Incorrect!"
#       return false
#     end
    
#   end

# end