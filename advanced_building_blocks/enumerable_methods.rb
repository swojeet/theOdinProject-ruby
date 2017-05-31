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
end

[0,1,2].my_each { |x| puts x}
[5,1,2,4].my_each_with_index { |x,y| puts "#{x} and #{y}"}
