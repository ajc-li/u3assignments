def my_benchmark(number_of_times)
	begininng_time = Time.now
	number_of_times.times {yield}
	(Time.now - starting_time)
end


my_benchmark(1) {puts "hi"}