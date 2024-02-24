# frozen_string_literal: true

require_relative 'tic_tac_toe'

game = TicTacToe::Game.new
now_player = game.player1

puts "The First is #{now_player.name}"

loop do
  game.print_board
  puts "Your turn, #{now_player.name}"

  position = ''
  marker = now_player.marker
  game_over = false

  loop do
    puts 'Choose position:'
    position = gets.chomp.strip

    game_over = true if %w[q quit].include? position

    break if game_over || game.set_marker(position.to_i, marker)
  end

  if game_over
    break

  elsif game.win_match marker
    game.print_board
    puts "#{now_player.name} has won!!!"

    break
  elsif game.all_draw
    game.print_board
    puts 'All is draw...'
    break
  else
    now_player = now_player == game.player1 ? game.player2 : game.player1
  end
end
