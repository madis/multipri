require_relative 'cli_ui'
require_relative 'primes_table'

module Multipri
  class App
    def self.run(args)
      new(CliUI, PrimesTable).run(args)
    end

    def initialize(ui, table)
      @ui = ui
      @table = table
    end

    def run(input)
      count = ui.read(input)
      ui.write(table.generate(count))
    end

    private

    attr_reader :ui, :table
  end
end
