class Integer
  # Integer#hash already implemented for you  
end

class Array
  def hash
    key = nil

    # self.length.times do
    #   ele = self.sample

    self.each_with_index do |el, i|
      key = el.hash ^ i.hash
    end
    # key.to_i(2).hash
    key.hash
  end
end

class String
  def hash
    key = nil
    alpha = ("a".."z").to_a

    self.chars.each_with_index do |char, i|
      key = alpha.index(char) ^ i.hash
    end

    key.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    key = nil
    array = self.to_a
    array.sort_by(&:hash).hash

    # array.flatten.each.with_index do |ele, i|
    #   key = ele ^ i.hash
    # end
    # key
    
  end
end
