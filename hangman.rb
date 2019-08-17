# frozen_string_literal: true

require './game.rb'

words = []

File.open('categories.txt') do |file|
  file.each do |line|
    words << line.upcase.split(/\W+/) if line[0] != '#' && line[0] != "\n"
  end
end

system 'clear'

puts <<~ENDTEXT
  Welcome to Hangcir :D
  You have 3 lifes, each turn you can try a whole word or just one letter
  If you miss a try you lose one life, otherwise if you hit twice in a row you will earn one life (max 3)
  If you lose all your lives, game over.

  Please type one category number from the listed below to start the game

ENDTEXT

# TODO: check here if txt is wrong or empty

words.each_with_index do |line, index|
  puts "#{index} #{line[0]}"
end

user_number = gets.chomp.to_i

while user_number > words.length - 1 || user_number.negative?
  puts "Please insert a correct number (0 to #{words.length - 1})"
  user_number = gets.chomp.to_i
end

# is this gambiarra or ugly? (and i was doing game = new Game() ._.)
game = Game.new(words[user_number][rand(1..words[user_number].length - 1)])

while game.ongoing
  system 'clear'
  puts game
  puts 'Please insert one letter or a whole word to make a try'
  game.try(gets.chomp.upcase)
end
