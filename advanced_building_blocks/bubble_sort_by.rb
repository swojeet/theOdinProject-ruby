def bubble_sort_by(array)
  while (sorted?(array) == false) do
    for x in (0..array.length-2) do
      if (yield(array[x],array[x+1]) > 0)
        array[x], array[x+1] = array[x+1], array[x]
      end
    end
  end
  array
end

def sorted?(array)
  sorted_array = array.sort_by { |word| word.length} 
  array ==  sorted_array ? true : false  
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

# puts ["hi","hello","hey"].sort
# ['a','d','c','b'].sort