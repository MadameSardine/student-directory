def input_students
	print "Please enter the names of the students.\nTo finish, just hit return twice.\n"
	#create an empty array
	students = []
	#gets the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :september}
		print "Now we have #{students.length} students\n"
		#get another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end

def print_header
	print "The students of my cohort at Makers Academy\n-------------------\n"
end

def print_(students)
	students.each do |student|
		print "#{student[:name]} (#{student[:cohort]} cohort)\n"
	end
end

def print_footer(names)
print "Overall it looks like we have #{names.length} students but some names may be missing from the list.\n"
end

#nothing happens until we call the methods
students = input_students
print_header
print_(students)
print_footer(students)