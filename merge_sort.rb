# build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
# An input of [3, 2, 1, 13, 8, 5, 0, 1] should return [0, 1, 1, 2, 3, 5, 8, 13] and an input of [105, 79, 100, 110] should return [79, 100, 105, 110]

def merge_sort(array)
  #base case
  # array.length == 1
  if array.length <= 1
    return array
  #recursive case
  else
    left_part = array.slice(0, array.length / 2)
    right_part = array.slice(array.length  / 2..)

    sorted_left = merge_sort(left_part)
    sorted_right = merge_sort(right_part)
    merge(sorted_left, sorted_right)
  end
end

def merge(array1, array2)
  sorted_array = []
  while array1.length > 0 || array2.length > 0
    if array2.length == 0
      sorted_array << array1.first
      array1.shift
    elsif array1.length == 0
      sorted_array << array2.first
      array2.shift
    elsif array1.first < array2.first
      sorted_array << array1.first
      array1.shift
    elsif array1.first >= array2.first
      sorted_array << array2.first
      array2.shift
    end
  end
  sorted_array
end

array1 = [0, 4, 5, 90] 
array2 = [7, 9, 26, 80]

# p merge(array1, array2)

# merge only works with already sorted arrays
# I think this should be ok, as we should be starting sorting from 1 length arrays in the recursion process

array3 = [7, 0, 2, 4, 5, 8, 9]

# p merge_sort(array3)
# p merge_sort([105, 79, 100, 110])
p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])


