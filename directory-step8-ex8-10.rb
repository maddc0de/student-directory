def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete_suffix!("\n").to_s
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter worst enemy"
    worst_enemy = gets.chomp.to_s
    worst_enemy = "The World" if worst_enemy.empty?
    puts "Please enter cohort month"
    month = gets.chomp.to_sym.capitalize
    month = "March" if month.empty?
    # add the student hash to the array
    students << {name: name, enemy: worst_enemy, cohort: month}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.to_s
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if students.length > 0
    students.each do |student|
      puts "#{student[:name]}, #{student[:enemy]}'s worst enemy (#{student[:cohort]} cohort)"
    end
  end
end

def print_cohort_group(students)
  puts "which month of cohorts would you like to see?"
  user_input = gets.chomp.to_sym.capitalize
  cohort_group = students.select do |student|
    student[:cohort] == user_input
  end
  puts cohort_group

end

def print_footer(students)
  puts "Overall, we have one great student" if students.count == 1 
  puts "Overall, we have #{students.count} great students" if students.count > 1
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
# print_cohort_group(students)
print_footer(students)