# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    numbers_array = numbers.scan(/[0-9-]+/).map(&:to_i)
    raise "negatives not allowed - #{list_negative_numbers(numbers_array)}" if list_negative_numbers(numbers_array)
    numbers_array.reduce(0) { |sum, i| sum + i }
  end

  private

  def list_negative_numbers(numbers_array)
    negative_numbers = numbers_array.select { |num| num < 0}
    if negative_numbers.size > 0
      return negative_numbers.join(",")
    else
      return false
    end
  end
end
