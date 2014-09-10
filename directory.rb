def input_students
	print "Please enter the name and cohort of the students.\nTo finish, just hit return 3 times.\n"
	#create an empty array
	students = []
	#gets the information
	name = gets.chomp
	cohort = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => cohort}
		print "Now we have #{students.length} students\nPlease enter information for next student\n"
		#get another name from the user
		name = gets.chomp
		cohort = gets.chomp
	end
	#return the array of students
	students
end

def print_header
	print "The students of my cohort at Makers Academy\n-------------------\n"
end

def print_(students)
	students.each do |student|
		puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(60)
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