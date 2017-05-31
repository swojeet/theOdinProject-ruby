#Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology

def bubble_sort(array)
  while (array != array.sort) do
    for x in (0..array.length-2) do
      if ((array[x] <=> array[x+1]) == 1)
        array[x], array[x+1] = array[x+1], array[x]
      end
    end
  end
  array
end

bubble_sort([4,3,78,2,0,2])

#Now create a similar method called #bubble_sort_by which sorts an array but accepts a block. The block should take two arguments which represent the two elements currently being compared. Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort your array.

def bubble_sort_by(array)
  while (array != array.sort_by { |word| word.length}) do
    for x in (0..array.length-2) do
      if (yield(array[x],array[x+1]) > 0)
        array[x], array[x+1] = array[x+1], array[x]
      end
    end
  end
  array
end

bubble_sort_by(["hi","hello","hey","a"]) do |left,right|
  left.length - right.length
end