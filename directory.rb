#let's put all students into an array
students = [
{:name => "Bernard Mordan", :cohort => :september},
{:name => "Stephens Hat", :cohort => :september},
{:name => "Stephens Hat", :cohort => :september},
{:name => "Nicole Pell", :cohort => :september},
{:name => "Yvette Cook", :cohort => :september},
{:name => "Elena Garrone", :cohort => :september},
{:name => "Fadie", :cohort => :september},
{:name => "Tim", :cohort => :september},
{:name => "Ella Nancy Fay", :cohort => :september},
{:name => "Andrew Hercules", :cohort => :september},
{:name => "Camilla", :cohort => :september},
{:name => "Pablo", :cohort => :september},
{:name => "Rachel", :cohort => :september},
{:name => "Anna Schechter", :cohort => :september},
{:name => "Sandrine", :cohort => :september}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
puts "Overall it looks like we have #{names.length} students but some names may be missing from the list."
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)