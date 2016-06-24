#my_reverse 

def my_reverse(input)
	string = ""
	for i in (input.length -1).downto(0)
		string << input[i]
	end
	string
end

puts my_reverse("abc")
puts my_reverse("eat my poop")