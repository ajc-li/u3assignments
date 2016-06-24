class Array
	def my_each
		i = 0
		while i <self.size
			yield(self[i])
			i+=1
		end
		self
	end
end

[1,2,5].my_each{|num| print num}