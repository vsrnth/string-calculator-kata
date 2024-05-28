# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    numbers_array = numbers.scan(/[0-9-]+/).map(&:to_i)
    negative_numbers = list_negative_numbers(numbers_array)
    raise "negatives not allowed - #{negative_numbers}" if negative_numbers

    numbers_array.reduce(0) { |sum, i| sum + i }
  end

  private

  def list_negative_numbers(numbers_array)
    negative_numbers = numbers_array.select(&:negative?)
    negative_numbers.join(',') if negative_numbers.size.positive?
  end
end
