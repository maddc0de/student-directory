@students = [] # an empty array accessible to all methods
@feedback

def process_feedback
  if !@feedback.nil? == true
    puts "action completed"
  else
    puts "unable to complete action"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  @feedback = selection
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
  process_feedback
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  cohort = :november
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_filename
  puts "Please enter the file name"
  @filename = STDIN.gets.chomp
end

def save_students
  input_filename
  # open the file for writing
  file = File.open(@filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      cvs_line = student_data.join(",")
      file.puts cvs_line
    end
  end
end

def load_students
  input_filename
  file = File.open(@filename, "r") do |file|
    file.readlines.each do |line| # example line: joker,november
      name, cohort = line.chomp.split(",") # name = joker  cohort = november
      add_students(name, cohort)
    end
  end
end

def try_load_students
  default_file = "students.csv"
  filename = ARGV.first || default_file # first arg from the command line
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

# try_load_students
interactive_menu