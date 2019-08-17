# frozen_string_literal: true

words = []

File.open('categories.txt') do |file|
  file.each do |line|
    words << line.upcase.split(/\W+/) if line[0] != '#' && line[0] != "\n"
  end
end
