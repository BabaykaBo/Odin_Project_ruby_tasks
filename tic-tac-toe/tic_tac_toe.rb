# frozen_string_literal: true

module TicTacToe
  # Class Board fot Tic-Tac-Toe
  class Board
    def initialize
      @lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end

    def print
      puts '--+---+--'
      @lines.each do |line|
        puts line.join(' | ')
        puts '--+---+--'
      end
    end

    def set_cill(cill, marker)
      @lines.each do |line|
        next unless line.include?(cill) && cill.is_a?(Integer)

        index = line.find_index(cill)
        line[index] = marker

        puts "Marker #{marker} is set to position #{cill}"
        return true
      end
      puts 'There is no such position. Choose another'
      false
    end

    def lines
      @lines.flatten
    end
  end

  # Player class
  class Player
    def initialize(player_name, player_marker)
      @name = player_name
      @marker = player_marker
    end

    attr_reader :name, :marker
  end

  # Class for game management
  class Game
    LINES = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    def initialize
      @board = Board.new
      @player1 = Player.new(player_name, player_marker('X'))
      @player2 = Player.new(player_name, player_marker('O'))

      puts 'Game Starts!'
    end

    attr_reader :player1, :player2

    def print_board
      @board.print
    end

    def set_marker(position, marker)
      @board.set_cill position, marker
    end

    def win_match(marker)
      LINES.each do |indexes|
        values = indexes.map { |index| @board.lines[index] }
        match = values.uniq
        return true if (match.length == 1) && match.include?(marker)
      end

      false
    end

    def all_draw
      @board.lines.none? { |value| value.is_a? Integer }
    end

    private

    def player_name
      player_name = ''

      while player_name.empty?
        puts 'Write first player name: '
        player_name = gets.chomp.strip
      end

      player_name
    end

    def player_marker(marker)
      puts "Your marker is #{marker}"
      marker
    end
  end
end
