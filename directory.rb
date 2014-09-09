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
#and then print them
puts "The students of my cohort at Makers Academy"
puts "-------------------"
students.each do |student|
	puts student
end

#finally, we print the total
puts "Overall it looks like we have #{student_length} students but some names may be missing from the list."