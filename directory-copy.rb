def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter worst enemy"
        worst_enemy = gets.chomp
        # add the student hash to the array
        students << {name: name, enemy: worst_enemy, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end    

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]}, #{student[:enemy]}'s worst enemy (#{student[:cohort]} cohort)"
    end
end

def print_beginning_letter(students, letter)
    puts "Students whose name begins with a letter #{letter}"
    students.each_with_index do |student, index|
        if student[:name][0] == letter
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end

def name_shorter_than_12_chars(students)
    puts "Students whose name is shorter than 12 characters"
    students.each_with_index do |student, index|
        if student[:name].length < 12
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
# print_beginning_letter(students, "C")
# name_shorter_than_12_chars(students)
# print_footer(students)