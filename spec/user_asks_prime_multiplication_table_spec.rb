require 'rspec'
require_relative '../lib/multipri'

RSpec.describe 'User requests prime multiplication table' do
  it 'prints the table' do
    output = Multipri::App.run(['--count', '3']).to_s
    primes_table = <<~END
      +---+----+----+----+
      |   | 2  | 3  | 5  |
      +---+----+----+----+
      | 2 | 4  | 6  | 10 |
      | 3 | 6  | 9  | 15 |
      | 5 | 10 | 15 | 25 |
      +---+----+----+----+
    END

    expect(output).to eq(primes_table.rstrip)
  end
end
