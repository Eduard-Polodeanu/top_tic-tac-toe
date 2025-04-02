class Player
  @@number_of_players = 0
  @@dissallowed_board_symbols = ('0'..'9').to_a + [' ', '']
  attr_accessor :board_symbol

  def initialize
    @@number_of_players += 1
    @player_number = @@number_of_players
    puts "Player #{@player_number}: Input the symbol you want to play with: "
    @board_symbol = get_input
    @win_flag = false
  end

  def to_s
    "Player #{@player_number} (#{@board_symbol}): "
  end

  private

  def get_input
    loop do
      input = gets.chomp
      if input_valid?(input) == false
        @@dissallowed_board_symbols.push(input)
        return input
      end
      puts 'The chosen symbol is not allowed. Input another one: '
    end
  end

  def input_valid?(string)
    @@dissallowed_board_symbols.include?(string)
  end
end
