require 'optparse'
require 'terminal-table'

module Multipri
  class CliUI
    def self.read(args)
      options = {}
      OptionParser.new do |opts|
        opts.on('-c', '--count [COUNT]', Integer, 'Number of primes to use') do |c|
          options[:count] = c
        end
      end.parse(args)
      options.fetch(:count)
    end

    def self.write(table)
      style = {
        all_separators: false
      }
      Terminal::Table.new(style: style) do |t|
        t.headings = ['', *table.row_titles]
        table.rows.each do |r|
          t << [r.title, *r.entries]
        end
      end
    end
  end
end
