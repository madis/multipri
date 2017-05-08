require_relative '../lib/multipri/prime.rb'
require 'prime'

RSpec.describe Multipri::Prime do
  it 'calculates 2' do
    expect(described_class.new.take(1)).to eq [2]
  end

  it 'calculates 3' do
    expect(described_class.new.take(2)).to eq [2, 3]
  end

  it 'calculates more' do
    expect(described_class.new(100).take(10)).to eq Prime.take(10)
  end
end
