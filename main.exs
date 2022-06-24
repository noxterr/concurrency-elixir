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
list [1, 2, 3]

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