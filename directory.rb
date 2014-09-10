def input_students
	print "Please enter the names, hobbies, country of birth and height of the students.\nTo finish, just hit return 5 times.\n"
	#create an empty array
	students = []
	#gets the information
	name = gets.chomp
	hobbies = gets.chomp
	country_birth = gets.chomp
	height = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :september, :hobbies => hobbies, :country_birth => country_birth, :height => height}
		print "Now we have #{students.length} students\nPlease enter information for next student\n"
		#get another name from the user
		name = gets.chomp
		hobbies = gets.chomp
		country_birth = gets.chomp	
		height = gets.chomp
	end
	#return the array of students
	students
end

def print_header
	print "The students of my cohort at Makers Academy\n-------------------\n"
end

def print_(students)
	students.each_with_index do |student, index|
		puts "#{index + 1}. #{student[:name]}, born in #{student[:country_birth]}, #{student[:height]} m high (#{student[:cohort]} cohort). Hobbies are: #{student[:hobbies]}\n"
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