require 'rspec'

describe StringCalculator do
  subject(:calculator) { described_class.new }
  it 'should return 0 for an emptry string input' do
    expect(calculator.add('')).to eq(0)
  end
end
