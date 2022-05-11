module Enumerable
  # Your code goes here
  def my_each
    for i in self
      yield i
    end
  end

  def my_each_with_index
    counter = 0
    for i in self
      yield i, counter
      counter += 1
    end
  end

  def my_select(&block)
    return to_enum(:my_select) unless block_given?

    truthy = []
    self.my_each do |value|
      truthy.push(value) if block.call(value)
      # puts value if block.call(value)
    end
    truthy
  end

  def my_all?(&block)
    return to_enum(:my_all?) unless block_given?

    my_each do |value|
      return false unless block.call(value)
    end
    true
  end

  def my_any?(&block)
    my_each do |value|
      return true if block.call(value)
    end
    false
  end

  def my_none?(&block)
    my_each do |value|
      return false if block.call(value)
    end
    true
  end

  def my_count(&block)
    return length unless block_given?
    count = 0
    my_each do |value|
      count += 1 if block.call(value)
    end
    count
  end

  def my_map(&block)
    mapped = []
    my_each do |value|
      mapped.push(block.call(value))
    end
    mapped
  end

  def my_inject(initial_value, &block)
    accumulator = initial_value ? initial_value : 0
    my_each do |value|
      accumulator = block.call(accumulator, value)
    end
    accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield i
    end
  end
end

