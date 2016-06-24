#fibonacci sequence

def fibs(integer)
	x_integer = [0,1]
	(integer-2).times do
		x_integer << x_integer [-1] + x_integer [-2]
	end
	return x_integer
end


print fibs(5)