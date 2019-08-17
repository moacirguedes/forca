# frozen_string_literal: true

class Game
  attr_reader :ongoing

  @hit_last = false
  @ongoing = true

  def initialize
    @lives = 3
    @attempts = 0
    @points = 0
  end

  def to_s
    "You have #{@lives} lives left and you made #{@attempts} attempts."
  end

  def increase_attempts
    @attempts += 1
  end

  def increase_points
    increase_attempts
    @points += 1 if @hit_last && @points < 3
    @hit_last = true
  end

  def decrease_points
    increase_attempts
    @points -= 1 if @points.positive?
    @hit_last = false
    end_game if @points.zero?
  end

  def end_game
    @ongoing = false
    puts 'you lost :D'
  end
end
