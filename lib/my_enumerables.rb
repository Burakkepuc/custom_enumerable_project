module Enumerable
  # Your code goes here
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
        yield (self[i])
      end
      self
    else
      return "No block given"
    end
  end
end
