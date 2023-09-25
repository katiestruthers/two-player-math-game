require './Player'

class Game
  def initialize
    @turn = 0
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @over = false
    self.start
  end

  def start
    while !@over do
      @turn % 2 == 0 ? self.turn(@player1) : self.turn(@player2)
    end
    puts "--- GAME OVER ---"
    puts "Good bye!"
  end

  def turn(player)
    rand1 = rand(1..20)
    rand2 = rand(1..20)
    result = rand1 + rand2

    puts "--- NEW TURN ---" unless @turn == 0
    puts "#{player.name}: What does #{rand1} plus #{rand2} equal?"
    answer = gets.chomp.to_i

    @turn += 1
    self.score(player, result == answer)
  end

  def score(player, bool)
    if bool
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
      player.lives -= 1
    end

    @over = (@player1.lives == 0 or @player2.lives == 0)
    if !@over
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    else 
      @player1.lives == 0 ? winner = @player2 : winner = @player1
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
    end
  end
end