class Board
  attr_accessor :board_values

  def initialize
    @board_values = ('1'..'9').to_a
  end

  def draw_board
    puts 'Current board:'
    puts '_____________'
    puts "| #{@board_values[0]} | #{@board_values[1]} | #{@board_values[2]} |"
    puts "| #{@board_values[3]} | #{@board_values[4]} | #{@board_values[5]} |"
    puts "| #{@board_values[6]} | #{@board_values[7]} | #{@board_values[8]} |"
    puts '‾‾‾‾‾‾‾‾‾‾‾‾‾'
  end

  def reset_board
    @board_values = ('1'..'9').to_a
    draw_board
  end

  def change_value(player)
    loop do
      puts "#{player}choose board position: "
      position = gets.chomp
      if position_valid?(position)
        @board_values[Integer(position) - 1] = player.board_symbol
        break
      else
        puts 'Invalid position.'
      end
    end
  end

  def position_valid?(position)
    @board_values.intersection(('1'..'9').to_a).include?(position)
  end

  def check_game_state
    @board_values.each_with_index do |value, index|
      if [1, 4, 7].include?(index) && value == @board_values[index - 1] && value == @board_values[index + 1] # horizontal win-con
        return 'win', value
      end

      if [3, 4, 5].include?(index) && value == @board_values[index - 3] && value == @board_values[index + 3] # vertical win-con
        return 'win', value
      end

      if [4].include?(index) # cross win-con
        if value == @board_values[index - 4] && value == @board_values[index + 4]
          return 'win', value
        elsif value == @board_values[index - 2] && value == @board_values[index + 2]
          return 'win', value
        end
      end
    end

    return ['tie', nil] if game_tie?

    ['playing', nil]
  end

  def game_tie?
    @board_values.intersection(('1'..'9').to_a).empty?
  end
end
