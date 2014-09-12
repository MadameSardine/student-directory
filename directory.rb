@students = []
@students_cohort = []
@months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

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

def set_cohort
	# set a default value for cohort if empty
	if @cohort.empty?
		then @cohort = "unknown"
	else
		@cohort
	end
end

def ask_cohort
	print "What is the cohort?"
	# gets the cohort
	@cohort = STDIN.gets.chomp.downcase.to_sym
	# check the spelling of the cohort
	while !@months.include?@cohort 
		puts "Please re-enter cohort"
		@cohort = STDIN.gets.chomp.downcase.to_sym
		if @cohort.empty?
			break
		end
	end
	set_cohort
end

def input_students
	# ask for student name
	print "Please enter the name of the student.\nTo finish, just hit return 2 times.\n"
	# gets the name
	name = STDIN.gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# ask for the cohort
		ask_cohort
		# add the student hash to the array
		add_student(name, @cohort) 
		# print the number of student(s) with the correct form
		print "Now we have #{@students.length} #{students_form}.\nPlease enter the name of the next student\n"
		#get another name from the user
		name = STDIN.gets.chomp
	end
	#return the array of students
	@students
end

def add_student(name, cohort)
 	@students << {:name => name, :cohort => cohort}
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
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
		when "4"
			load_students
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
		process(STDIN.gets.chomp)
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

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(",")
		add_student(name, cohort)
	end
	file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end

try_load_students
interactive_menu