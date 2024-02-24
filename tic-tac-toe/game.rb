# frozen_string_literal: true

require_relative 'tic_tac_toe'

module TicTacToe
  # Class for game management
  class GameManager
    def initialize
      @game = TicTacToe::Game.new
      @now_player = @game.player1
      @game_over = false
    end

    def start_game # rubocop:disable Metrics/MethodLength
      @game_over = false
      @now_player = @game.player1
      puts "The First is #{@now_player.name}"

      loop do
        @game.print_board
        puts "Your turn, #{@now_player.name}"

        marker = @now_player.marker

        choose_position marker

        break if @game_over || handle_move(marker)

        switch_player
      end
    end

    private

    def choose_position(marker)
      loop do
        puts 'Choose position:'
        position = gets.chomp.strip

        @game_over = true if %w[q quit].include? position

        break if @game_over || @game.set_marker(position.to_i, marker)
      end
    end

    def handle_move(marker) # rubocop:disable Metrics/MethodLength
      if @game.win_match marker
        @game.print_board
        puts "#{@now_player.name} has won!!!"
        true
      elsif @game.all_draw
        @game.print_board
        puts 'All is draw...'
        true
      else
        false
      end
    end

    def switch_player
      @now_player = @now_player == @game.player1 ? @game.player2 : @game.player1
    end
  end
end
