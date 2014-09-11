@students = []
@students_cohort = []
@months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

def print_header
	print "The students of my cohort at Makers Academy\n-------------------\n"
end

def print_students_list
	@students.each do |student|
		puts "\t*#{student[:name].capitalize}, (#{student[:cohort]} cohort)"
	end
end

def print_by_cohort
	@months.each do |month|
		puts "Students in the #{month} cohort:"
		@students_cohort = @students.select {|student| month == student[:cohort]}
		@students_cohort.each do |students_cohort|
			puts "\t*#{students_cohort[:name].capitalize}"
		end
	end
end

def print_footer
	puts "Overall it looks like we have #{@students.length} #{students_form} but some names may be missing from the list."
end

def students_form 
	if @students.length == 1
		then "student"
	else "students"
	end
end

def input_students
	# ask for student name
	print "Please enter the name of the student.\nTo finish, just hit return 2 times.\n"
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
			while !@months.include?cohort
				puts "Please re-enter cohort"
				cohort = gets.chomp.capitalize
			end
		end
		# add the student hash to the array
		@students << {:name => name, :cohort => cohort}
		# print the number of student(s) with the correct form
		print "Now we have #{@students.length} #{students_form}.\nPlease enter the name of the next student\n"
		#get another name from the user
		name = gets.chomp
	end
	#return the array of students
	@students
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "9. Exit"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def process(selection)
	case selection
		when "1"
			# input the students
			input_students
		when "2"
			# show the students
			show_students
		when "3"
			save_students
		when "9"
			exit # this will cause the program to terminate
		else
			puts "I don't know what you meant, try again"
	end	
end

def interactive_menu
	loop do
		# 1. print the menu and ask the user what to do
		print_menu
		# 2. read the input and do what the user has asked
		process(gets.chomp)
	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

interactive_menu