# frozen_string_literal: true

class Game
  attr_reader :ongoing

  def initialize(word)
    @lives = 3
    @attempts = 0
    @word = word
    @secret_word = '-' * word.length # how to use _ D:
    @hit_last = false
    @ongoing = true
    @alphabet = %w[A B C D E F G H I J K
                   L M N O P Q R S T U V W X Y Z]
  end

  def to_s
    <<~ENDTEXT
      You got #{@lives} lives left and you made #{@attempts} attempts.

      You still got those letters to try #{@alphabet}

      The secret word is #{@secret_word}  (#{@word.length} letters)

    ENDTEXT
  end

  def try(attempt)
    score(attempt) unless check_alphabet(attempt)
  end

  def score(attempt)
    if attempt.length == 1 && @word[attempt]
      increase_lives
      update_secret_word(attempt)
    elsif attempt == @word
      increase_attempts
      win_game
    else
      decrease_lives
      delete_alphabet(attempt) if attempt.length == 1
    end
  end

  def increase_attempts
    @attempts += 1
  end

  def check_alphabet(letter)
    true unless @alphabet.include?(letter) || letter.length != 1
  end

  def delete_alphabet(letter)
    @alphabet.delete(letter)
  end

  def increase_lives
    increase_attempts
    @lives += 1 if @hit_last && @lives < 3
    @hit_last = true
  end

  def decrease_lives
    increase_attempts
    @lives -= 1 if @lives.positive?
    @hit_last = false
    end_game if @lives.zero?
  end

  def update_secret_word(attempt)
    delete_alphabet(attempt)
    @secret_word.each_char.with_index do |_char, index|
      @secret_word[index] = attempt.upcase if @word[index] == attempt
    end
    win_game unless @secret_word.include?('-')
  end

  def win_game
    @ongoing = false
    puts "You won with #{@attempts} attempts"
  end

  def end_game
    @ongoing = false
    puts "you lose with #{@attempts} attempts. The secret word was #{@word}"
  end
end
