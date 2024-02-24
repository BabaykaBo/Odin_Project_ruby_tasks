# frozen_string_literal: true

module TicTacToe
  # Class Board for Tic-Tac-Toe
  class Board
    attr_reader :lines

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

    def set_cell(cell, marker)
      @lines.each do |line|
        next unless line.include?(cell) && cell.is_a?(Integer)

        line[line.index(cell)] = marker

        puts "Marker #{marker} is set to position #{cell}"
        return true
      end
      puts 'There is no such position. Choose another'
      false
    end
  end

  # Player class
  class Player
    attr_reader :name, :marker

    def initialize(name, marker)
      @name = name
      @marker = marker
    end
  end

  # Class for game building
  class Game
    LINES = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].freeze

    def initialize
      @board = Board.new
      @player1 = Player.new(player_name('X'), 'X')
      @player2 = Player.new(player_name('O'), 'O')

      puts 'Game Starts!'
    end

    attr_reader :player1, :player2

    def print_board
      @board.print
    end

    def set_marker(position, marker)
      @board.set_cell(position, marker)
    end

    def win_match(marker)
      LINES.any? do |indexes|
        values = indexes.map { |index| @board.lines.flatten[index] }
        values.uniq == [marker]
      end
    end

    def all_draw
      @board.lines.flatten.none? { |value| value.is_a? Integer }
    end

    private

    def player_name(marker)
      player_name = ''

      while player_name.empty?
        puts "Write the name for the player with marker #{marker}:"
        player_name = gets.chomp.strip
      end

      player_name
    end
  end
end
