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

end

[0,1,2].my_each { |x| puts x}
[5,1,2,4].my_each_with_index { |x,y| puts "#{x} and #{y}"}
[5,1,2,4].my_select { |x| x%2 ==0}
[5,1,2,4].my_all { |x| x%2 ==0}
[2,2,2].my_any { |x| x%3 ==0}
