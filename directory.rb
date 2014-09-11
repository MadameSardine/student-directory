def months
	["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
end

def input_students
	# create an empty array
	students = []

	# ask for student name
	print "Please enter the name of the first student.\nTo finish, just hit return 2 times.\n"
	# gets the name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# ask for the cohort
		print "What is the cohort?"
		# gets the cohort
		cohort = gets.chomp.capitalize
		# set a default value for cohort if empty
		if cohort.empty?
			then cohort = "Unknown"
		else
			# check the spelling of the cohort
			while !months.include?cohort
				puts "Please re-enter cohort"
				cohort = gets.chomp.capitalize
			end
		end

		# add the student hash to the array
		students << {:name => name, :cohort => cohort}
		# print the number of student(s) with the correct form
		if students.length > 1
			then students_form = "students"
			else students_form = "student"
		 end
		print "Now we have #{students.length} #{students_form}\nPlease enter the name of the next student\n"
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
		puts "\t*#{student[:name]}, (#{student[:cohort]} cohort)"
	end
end

def print_by_cohort(months, students)
	months.each do |month|
		puts "Students in the #{month} cohort:"
		students_cohort = students.select {|student| month == student[:cohort]}
		print_(students_cohort)
	end
end

def print_footer(names)
	if names.length > 1
		then students_form = "students"
		else students_form = "student"
	end
	puts "Overall it looks like we have #{names.length} #{students_form} but some names may be missing from the list."
end

#nothing happens until we call the methods
students = input_students
print_header
print_(students)
print_footer(students)