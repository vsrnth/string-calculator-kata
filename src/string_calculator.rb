# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    number_array = numbers.gsub("\n", ",").split(',').map(&:to_i)
    number_array.sum
  end
end
