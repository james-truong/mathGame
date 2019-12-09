require './player.rb'
require './turn.rb'
require './questions.rb'

class Game
  attr_accessor :currentPlayer, :p1, :p2

  def initialize()
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @currentPlayer = @p1
  end
end


game = Game.new()


while game.p1.lives > 0 && game.p2.lives > 0
  question = @questions.sample
  if game.currentPlayer == game.p1
    puts "#{game.currentPlayer.name}: #{question[:question]}"
    answer = gets.chomp
    if answer == question[:answer] 
      puts "#{game.currentPlayer.name}: Yes! You are correct."
    else
      puts "#{game.currentPlayer.name}: Seriously? You are wrong."
      game.currentPlayer.lives -= 1
    end
  puts "#{game.p1.name}: #{game.p1.lives} vs #{game.p2.name}: #{game.p2.lives}"
  game.currentPlayer = game.p2
  puts "----NEW TURN-----"

  else
    puts "#{game.currentPlayer.name}: #{question[:question]}"
    answer = gets.chomp
    if answer == question[:answer] 
      puts "#{game.currentPlayer.name}: Yes! You are correct."
    else
      puts "#{game.currentPlayer.name}: Seriously? You are wrong."
      game.currentPlayer.lives -= 1
    end
  puts "#{game.p1.name}: #{game.p1.lives} vs #{game.p2.name}: #{game.p2.lives}"
  game.currentPlayer = game.p1
  puts "----NEW TURN-----"
  end


end

winner = game.p1.lives > 0 ? game.p1: game.p2
puts "#{winner.name} won with a score #{winner.lives}/3!"
puts "----GAME OVER ----"