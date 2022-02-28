class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    h_key = key.hash
    resize! if num_buckets <= count
    if !self[h_key].include?(key)
      self[h_key] << key 
      @count += 1
    end
  end

  def include?(key) 
    self[key.hash].any? { |k| k == key } # returns a bucket
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    i = num % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_length = num_buckets * 2 # store length * 2
    old_store = @store # old set

    @store = Array.new(new_length) { Array.new } # new Set shell
    @count = 0 # count back to 0
    old_store.flatten.each do |ele|
      insert(ele)
    end
  end
end
