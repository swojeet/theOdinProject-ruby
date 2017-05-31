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
end

[0,1,2].my_each { |x| puts x}
[5,1,2,4].my_each_with_index { |x,y| puts "#{x} and #{y}"}
[5,1,2,4].my_select { |x| x%2 ==0}