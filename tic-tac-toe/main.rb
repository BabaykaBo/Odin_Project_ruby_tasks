# frozen_string_literal: true

puts 'Welcome to Tic-Tac-Toe!'
puts 'Start the game: [start (or any type), quit (or q)]'

start = gets.chomp.strip

until %w[quit q].include?(start)
  load 'game.rb'

  puts 'Restart the game?: [restart (or any type), quit (or q)]'
  start = gets.chomp.strip
end
puts 'Goodbye :)'
