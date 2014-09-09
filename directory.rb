#let's put all students into an array
students = [
"Bernard Mordan",
"Stephens Hat",
"Nicole Pell",
"Yvette Cook",
"Elena Garrone",
"Fadie",
"Tim",
"Ella Nancy Fay",
"Andrew Hercules",
"Camilla",
"Pablo",
"Rachel",
"Anna Schechter",
"Sandrine"
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------"
end

def print(names)
	names.each do |name|
		puts name
	end
end

def print_footer(names)
puts "Overall it looks like we have #{names.length} students but some names may be missing from the list."
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)