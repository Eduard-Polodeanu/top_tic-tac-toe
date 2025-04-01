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
    while @game_state == 'playing' # TODO: play again
      @players.each do |player|
        if @board.check_game_state[0] == 'win'
          @game_state = 'win'
          break
        end
        puts "#{player}choose board position: "
        position = gets
        @board.change_value(position, player.board_symbol)
        @board.draw_board
      end
    end
    @players.each do |player|
      puts "!!!#{player} WON THE GAME!!!" if player.board_symbol.strip == @board.check_game_state[1].strip
    end
  end
end
