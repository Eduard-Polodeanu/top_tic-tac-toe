require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @players = [Player.new, Player.new]
    @board.draw_board
    @game_state = 'playing'
    play_round
  end

  private

  def play_round
    while @game_state == 'playing'
      @players.each do |player|
        if @board.check_game_state[0] == 'win'
          @game_state = 'win'
          break
        end
        if @board.check_game_state[0] == 'tie'
          @game_state = 'tie'
          break
        end
        @board.change_value(player)
        @board.draw_board
      end
    end
    game_outcome
    play_again
  end

  def game_outcome
    if @game_state == 'win'
      @players.each do |player|
        puts "!!! #{player}WON THE GAME !!!" if player.board_symbol == @board.check_game_state[1]
      end
    elsif @game_state == 'tie'
      puts "!!! IT'S A TIE !!!"
    end
  end

  def play_again
    puts 'Do you want to play again? [yes/no]'
    choise = gets.chomp.downcase
    if choise == 'yes'
      @board.reset_board
      @game_state = 'playing'
      play_round
    else
      puts 'gg'
    end
  end
end
