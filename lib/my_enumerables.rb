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

  # my_all? method
  def my_all?
    arr = []
    self.my_each do |el|
      arr << yield(el)
    end

    return false if arr.include?(false)
    return true unless arr.include?(false)
  end

  # my_any? method
  def my_any?
    arr = []
    self.my_each do |el|
      arr << yield(el)
    end
    p arr

    return true if arr.include?(true)
    return false unless arr.include?(true)
  end

  # my_none? method
  def my_none?
    arr = []

    self.my_each do |el|
      arr << yield(el)
    end
    p arr
    if arr.include?(true)
      false
    else
      true
    end
  end

  # my_count
  def my_count
    arr = []
    if block_given?
      self.my_each do |el|
        yield(el) && arr << yield(el)
      end
      arr.length
    else
      self.length
    end
  end

  # my_map
  def my_map
    arr = []
    if block_given?
      self.my_each do |el|
        arr << yield(el)
      end
    end
    arr
  end

  #my_inject
  def my_inject(acc)
    self.my_each do |el|
      acc =  yield(acc ,el)
    end
    acc
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
