class Player
  @@number_of_players = 0
  attr_accessor :board_symbol

  def initialize
    @@number_of_players += 1
    @player_number = @@number_of_players
    puts "Player #{@player_number}: Input the symbol you want to play with: " # TODO: no duplicate symbol, no numbers
    @board_symbol = gets
    @win_flag = false
  end

  def to_s
    "Player #{@player_number} (#{@board_symbol.strip}): "
  end
end
