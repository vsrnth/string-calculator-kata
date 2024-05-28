# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    numbers_array = numbers.scan(/[0-9-]+/).map(&:to_i)
    numbers_array.reduce(0) { |sum, i| sum + i }
  end
end
