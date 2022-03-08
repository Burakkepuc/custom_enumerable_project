module Enumerable
  # my_each_with_index
  def my_each_with_index
    if block_given?
      for i in 0..self.length - 1
        yield(self[i], i)
      end
      self
    end
  end

  # my_select
  def my_select
    arr = []
    self.my_each { |el| arr.push(el) if yield(el) }
    arr
  end

  # my_all method
  def my_all?
    arr = []
    self.my_each do |el|
      arr << true if yield(el)
      arr << false unless yield(el)
    end

    return false if arr.include?(false)
    return true unless arr.include?(false)
  end

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for i in 0..self.length - 1
        yield(self[i])
      end
      self
    else
      return "No block given"
    end
  end
end
