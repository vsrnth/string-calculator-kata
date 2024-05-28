# frozen_string_literal: true

require 'rspec'
require_relative '../src/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }
  it 'should return 0 for an emptry string input' do
    expect(calculator.add('')).to eq(0)
  end
end
