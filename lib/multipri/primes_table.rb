require 'prime'

module Multipri
  class PrimesTable
    class Row
      attr_reader :title, :entries

      def initialize(title, entries)
        @title = title
        @entries = entries
      end

      def ==(other)
        other.class == self.class && other.state == self.state
        @title == other.title
      end

      protected

      def state
        [@title, @entries]
      end
    end

    def self.generate(size)
      new(size).generate
    end

    def initialize(size)
      @size = size
      @generated = false
    end

    def generate
      primes = Prime.new.first(@size)
      @row_titles = primes
      @rows = primes.map do |p|
        Row.new(p, primes.map { |q| p * q })
      end
      @generated = true
      self
    end

    def rows
      generate unless generated?
      @rows
    end

    def row_titles
      generate unless generated?
      @row_titles
    end

    private

    def generated?
      @generated
    end
  end
end
