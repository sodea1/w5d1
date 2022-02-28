require "byebug"
class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true if !self.include?(num)
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return @store[num]
  end

  private

  def is_valid?(num)
    (0..@store.length).include?(num)
  end

  def validate!(num)
    
  end

  
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].any? { |ele| ele == num }
  end

  private

  def [](num)
    i = num % @store.length
    @store[i] # returns a subarray with integers in it
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if num_buckets <= count
    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end

  end

  def include?(num)
    return self[num].any? { |ele| ele == num } # return T/F 
  end

  private

  def [](num)
    i = num % num_buckets
    @store[i] 
  end

  def num_buckets
    @store.size
  end

  def resize!
    new_length = num_buckets * 2
    old_store = @store
    # @store + Array.new(new_length) { Array.new }
    @store = Array.new(new_length) { Array.new }
    @count = 0
    old_store.flatten.each do |num|
      insert(num)# self[num] << num
    end
  end
end
