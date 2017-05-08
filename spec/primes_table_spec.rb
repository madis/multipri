require_relative '../lib/multipri/primes_table'

RSpec.describe Multipri::PrimesTable do
  it 'has correct rows in generated table' do
    expected_table = [
      described_class::Row.new(2, [4, 6]),
      described_class::Row.new(3, [6, 9]),
    ]
    expect(described_class.new(2).rows).to eq expected_table
  end

  it 'has correct row_titles' do
    expect(described_class.new(2).row_titles).to eq [2, 3]
  end
end
