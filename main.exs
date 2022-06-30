hello = 'yo' # default variable
IO.puts(hello)
IO.puts hello # parenthesis are optional, they say
IO.puts(:hello_there) # this is an atom and should print "hello there"

add_five = fn n -> n + 5 end # anonymous function, n is the argument and the result is the argument plus 5

# To make the function work, you can do
result = add_five.(4)  # fn.(params)
IO.puts(result) # This should print 9

add_ten = &(&1 + 10) # The capture operator simplifies the anonymous function

# Using nested calls to add 5 to 23, add 10, and eventually print it
# This is garbage nested stuff, we don't want this
IO.puts( add_ten.( add_five.(23) ) )

# Using the pipe operator to make it pretty

# This literally follows the procedure as it is spoken
# We first add to 23, 5. Then 10. Then we print
23 |> add_five.() |> add_ten.() |> IO.puts()

# Create a list with brackets
list = [1, 2, 3]

# Create a map for an Object (JSON like)
# I am not sure I can make one below another
map = %{
    3 => "four",
    "one" =>:two # This is an atom by the way
}

# Control logic

if true do
    IO.puts('It is true')
end

unless false do
    IO.puts('It is false')
end


# Cases logic
# Apparently, variables are immutable. So you have to assign the value of the case directly to the variable itself, and print it eventually
end_condition =
case {1, 2, 3} do
     {4, 5, 6} -> 'This clause won\'t match'
     {1, x, 3} -> 'This clause will match and bind x to 2 in this clause. So x=#{x}'
         _     -> 'This clause would match any value'
end

IO.puts (end_condition)


# Looping over the created array before
# For loop
for x <- list do # for value <- about the list, do function, end
  IO.puts(x)
end

# Looping over a map
# ForEach enumeration, of the object map, use function with k(key) and v (value)
# In that first element function, do what you want (IO.puts). End
Enum.each(map, fn {k, v} ->
  IO.puts("#{k} --> #{v}")
end)

# Progressing with dates, and I'll use them to show also string interpolations and Tuples

# This generates a standardized date
date = ~D[2000-01-01]
IO.puts(date)

# To interpolate a string, use double quote + hashtag that goes before a {}, like below shown
IO.puts('The date is #{date.year} - #{date.month} - #{date.day}')

# This is a tuple. and the result is this {{YYYY, M, GG}, {HH, mm, ss}} (UTC 0)
tuple_date = :calendar.universal_time

# We cannot print a tuple in a string-like standard. So we convert it into an array.
# From a tuple of tuples {{YYYY, M, GG}, {HH, mm, ss}} we will have an array of tuples [{YYYY, M, GG}, {HH, mm, ss}]
list_date = Tuple.to_list(tuple_date)

# Now we loop over each tuple element in the array to extract the tuple inside
# From the tuple, we will convert intern tuples into arrays and join them together with a separator
# !NB. Enum.join() as a second argument needs a double quote separator. NOT single quote
for single_date <- list_date do
  IO.puts('We are getting the tuple with nesting function #{Enum.join(Tuple.to_list(single_date), ":")}') # I use nested functions
  IO.puts('We are getting the tuple with pipe operations #{single_date |> Tuple.to_list |> Enum.join(": ")}') # I use the pipe operator to do the same thing
end
