# frozen_string_literal: true

require_relative 'game'

puts 'Welcome to Tic-Tac-Toe!'
puts 'Start the game: [start (or any type), quit (or q)]'

start = gets.chomp.strip

until %w[quit q].include?(start)

  TicTacToe::GameManager.new.start_game

  puts 'Restart the game?: [restart (or any type), quit (or q)]'
  start = gets.chomp.strip
end
puts 'Goodbye :)'
