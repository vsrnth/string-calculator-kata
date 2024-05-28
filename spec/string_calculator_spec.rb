# frozen_string_literal: true

require 'rspec'
require_relative '../src/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }
  it 'should return 0 for an emptry string input' do
    expect(calculator.add('')).to eq(0)
  end
  it 'should return sum of the numbers in string, if the numbers in string are separated by comma' do
    expect(calculator.add('1,2,3')).to eq(6)
  end
  it 'should return sum of the numbers in string, if the numbers in string have new line delimiters' do
    expect(calculator.add("1\n2,3")).to eq(6)
  end
  it 'should return sum of the numbers in string, the delimiters are passed in a line before the string' do
    expect(calculator.add("//;\n12;2")).to eq(14)
  end

  it 'should return sum of the numbers in string, the delimiters are not passed in a line before the string' do
    expect(calculator.add('12;2')).to eq(14)
  end

  it 'should not accept negative numbers' do
    expect { calculator.add('12,-2') }.to raise_error('negatives not allowed - -2')
    expect { calculator.add('12,-2,-4') }.to raise_error('negatives not allowed - -2,-4')
  end

  it 'should return sum of numbers in a string, irrespective of the length of the delimiters' do
    expect(calculator.add("//[***]\n1***2***3")).to eq(6)
  end
  it 'should return sum of numbers in string even if we have multiple delimiters in the string' do
    expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it 'should return sum of numbers in string even if multiple delimiters of length longer than one char are present in the string' do
    expect(calculator.add("//[#*][#%]\n1#*2#%3")).to eq(6)
  end

  it 'should ignore numbers greater than 1000 when adding numbers in string ' do
    expect(calculator.add("1,2,1004,3")).to eq(6)
  end
end
