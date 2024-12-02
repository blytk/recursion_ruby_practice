# Using iteration, write a method #fibs which takes a number and returns an array containing n number from the Fibonacci sequence
# An input of 8, the return value should be an array [0, 1, 1, 2, 3, 5, 8, 13]

def fibs(n)
  fibonacci_sequence = []
  for i in 0...n
    if i == 0 
      fibonacci_sequence << i
    elsif i == 1
      fibonacci_sequence << i
    else
      fibonacci_sequence << fibonacci_sequence[i - 1] + fibonacci_sequence[i - 2]
    end
  end
  fibonacci_sequence
end

p fibs(8)
p fibs(12)

# Write another method #fibs_rec which solves the same problem recursively

=begin
$fib_seq = []
def fibs_rec(n)
    # base case
    if n == 0 || n == 1
      $fib_seq[n] = n
      n
    else
      # recursive case
      value = fibs_rec(n - 1) + fibs_rec(n - 2)  
      $fib_seq[n] = value
    end
end
=end

def fibs_rec(n, fib_seq = [], first_call = true, limit = 0)
  if first_call == true
    limit = n - 1
    first_call = false
  end
  # base case
  if n == 0 || n == 1
    # fib_seq[n] = n if fib_seq[n].nil?
    value = n
  else
    #recursive case
    value = fibs_rec(n - 2, fib_seq, first_call, limit) + fibs_rec(n - 1, fib_seq, first_call, limit)
    # fib_seq[n] = value if fib_seq[n].nil?
  end
  # Insert value into array if within boundaries we desire (n - 1 items as we start counting from 0 in array)
  if n <= limit
    fib_seq[n] = value
  end
  # If n is over limit  (n - 1), we can return the array instead of the value, as it will be the last return value and there will be
  # no more recursive calls
  if n > limit
    return fib_seq
  end
  value
end

# p fibs_rec(8)
# p fibs_rec(12)
p fibs_rec(8)
p fibs_rec(12)