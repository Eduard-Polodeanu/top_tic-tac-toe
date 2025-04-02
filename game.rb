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
        @board.change_value(player)
        @board.draw_board
      end
    end
    @players.each do |player|
      puts "!!!#{player}WON THE GAME!!!" if player.board_symbol == @board.check_game_state[1]
    end
    return unless @game_state == 'win'

    play_again
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
