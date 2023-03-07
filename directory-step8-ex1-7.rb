def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.to_s
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter worst enemy"
    worst_enemy = gets.chomp
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
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

# each_with_index()
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}, #{student[:enemy]}'s worst enemy (#{student[:cohort]} cohort)".center(100)
  end
end

# only print the students whose name begins with a specific letter
def print_beginning_letter(students, letter)
  puts "Students whose name begins with a letter #{letter}"
  students.each_with_index do |student, index|
      if student[:name][0] == letter
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
  end
end

# only print the students whose name is shorter than 12 characters
def name_shorter_than_12_chars(students)
  puts "Students whose name is shorter than 12 characters"
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# rewritten each() method with while method 
# def print(students)
#   counter = 0
#   while counter <= students.length do 
#     puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
#     counter += 1
#     if counter == students.length
#       break
#     end
#   end
# end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
# print_beginning_letter(students, "C")
# name_shorter_than_12_chars(students)
print_footer(students)