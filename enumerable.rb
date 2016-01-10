#Project Enumerable: Recreate enumerables

module Enumerable
	def my_each
		return self unless block_given?
		count = 0					
		while count < self.size		
			yield(self[count])
			count += 1
		end
		self
	end
	
	def my_each_with_index
		return self unless block_given?
		counter = 0
		while counter < self.size 
			yield(self[counter], counter)
			counter += 1
		end
		self
	end
	
	def my_select
		return self unless block_given?
		result = []
		self.my_each{|x| result << x if yield(x) == true}
		result
	end
	
	def my_all?
		if block_given?
			self.my_each{|x| return false if yield(x) == false}
		end
		return true
	end
	
	def my_any?
		if block_given?
			self.my_each{|x| return true if yield(x) == true}
		end
		return false
	end
	
	def my_none?
		if block_given?
			self.my_each{|x| return false if yield(x) == true}
		end
		return true
	end
	
	def my_count(value = nil)
		count = 0
		if value
			self.my_each{|x| count += 1 if x == value}
			return count
		elsif block_given?
			self.my_each{|x| count += 1 if yield(x) == true}
			return count
		else
			return self.size
		end
	end
	
	def my_map(&proc)
		result = []
		if block_given?
			self.my_each{|x| result << proc.call(x)}
			return result
		end
	end
	
	def my_inject(initial = self.first)
		return self unless block_given?
		accumulator = initial
		self.my_each do |x|
			accumulator = yield(accumulator, x)
		end
		accumulator
	end
	
end #end of module

def multiply_els(array)	#method to test my_inject
		array.my_inject(1){|x,y| x * y}
end

