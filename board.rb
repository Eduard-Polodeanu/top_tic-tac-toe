class Board
  attr_accessor :board_values

  def initialize
    @board_values = Array(1..9)
  end

  def draw_board
    puts 'Current board:'
    puts '_____________'
    puts "| #{@board_values[0]} | #{@board_values[1]} | #{@board_values[2]} |"
    puts "| #{@board_values[3]} | #{@board_values[4]} | #{@board_values[5]} |"
    puts "| #{@board_values[6]} | #{@board_values[7]} | #{@board_values[8]} |"
    puts '‾‾‾‾‾‾‾‾‾‾‾‾‾'
  end

  def change_value(position, value)
    @board_values[Integer(position) - 1] = value # TODO: check for invalid position, dont allow to change same pos twice
  end

  def check_game_state
    @board_values.each_with_index do |value, index|
      if [1, 4, 7].include?(index) && value == board_values[index - 1] && value == board_values[index + 1] # horizontal win-con
        return 'win', value
      end

      if [3, 4, 5].include?(index) && value == board_values[index - 3] && value == board_values[index + 3] # vertical win-con
        return 'win', value
      end

      if [4].include?(index) # cross win-con
        if value == board_values[index - 4] && value == board_values[index + 4]
          return 'win', value
        elsif value == board_values[index - 2] && value == board_values[index + 2]
          return 'win', value
        end
      end
    end
    ['playing', nil]
  end
end
