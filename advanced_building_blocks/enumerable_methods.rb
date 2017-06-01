module Enumerable
  def my_each
    for i in 0...self.length
      yield self[i]
    end
  end

  def my_each_with_index
    for i in 0...self.length
      yield self[i], i
    end
  end

  def my_select
    ans = []
    self.my_each do |x|
      ans << x if yield x
    end
    ans
  end

  def my_all
    self.my_each do |x|
      return false unless yield x
    end
    return true
  end

  def my_any
    self.my_each do |x|
      return true if yield x
    end
    return false
  end

  def my_none?
    self.my_each do |x|
      return true unless yield x
    end
    return false
  end

  def my_count(element= nil)
    counter = 0
    self.my_each do |x|
      if block_given?
        counter += 1 if yield x
      elsif element
        return self[element-1]
      else
        return self.count
      end
    end
    counter
  end

  def my_map(some_proc = nil)
    ans = []
    if block_given?
      self.my_each do |x|
        ans << (yield x)
      end
    else
      self.my_each do |x|
        ans << some_proc.call(x)
      end
    end
    ans
  end

  def my_inject(value = false)
  	if (value == false)
  	  value = self[0]
  	  for x in 1...self.length do
    	  value = yield value, self[x]
    	end
  	else
      self.my_each do |x|
  	    value = yield value, x
  	  end
  	end
  	value
  end
end

def multiply_els(array)
  array.my_inject(1){|product, elem| product * elem}
end

[0,1,2].my_each { |x| puts x}
[5,1,2,4].my_each_with_index { |x,y| puts "#{x} and #{y}"}
[5,1,2,4].my_all? { |x| x%2 ==0}
[2,2,2].my_all? { |x| x%2 ==0}
[2,2,2].my_any? { |x| x%2 ==0}
[2,2,2].my_none? { |x| x%3 ==0}
[1, 2, 4, 2].my_count
[1, 2, 4, 2].count(2)
[1, 2, 4, 2].my_map {|i| i*i }
[5,6,7,8,9,10].my_inject(5){|sum, n| sum + n } 
multiply_els([2,4,5])

b = Proc.new{|i| i*i }
[1, 2, 4, 2].my_map(b)
[1, 2, 4, 2].my_map {|i| i*i }