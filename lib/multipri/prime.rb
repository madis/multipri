module Multipri
  class Prime
    include Enumerable

    def initialize(size=10)
      @size = size
    end

    def each
      return enum_for(:each) unless block_given?
      # Taken from https://rosettacode.org/wiki/Sieve_of_Eratosthenes
      nums = [nil, nil, *2..@size]
      (2..Math.sqrt(@size)).each do |i|
        (i**2..@size).step(i){|m| nums[m] = nil}  if nums[i]
      end
      nums.compact.each { |n| yield n }
    end
  end
end
