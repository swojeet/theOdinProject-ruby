#Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology

def bubble_sort(array)
  while (sorted?(array) == false) do
    for x in (0..array.length-2) do
      if ((array[x] <=> array[x+1]) == 1)
        array[x], array[x+1] = array[x+1], array[x]
      end
    end
  end
  array
end

def sorted?(array)
  array == array.sort ? true : false  
end

bubble_sort([4,3,78,2,0,2])

