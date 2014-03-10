require './lib/task'
require './lib/list'
require 'date'

@list_of_lists   = []

def main
  puts "Press 'a' to add a list, 'l' to show created lists and edit them, or 'd' to deltet a list"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_list
  when 'l'
    show_list
  when 'd'
    delete_list
  when 'x'
    exit
  else
    puts "not an option"
  end
main
end

def add_list
  puts "what is the name of your list?"
  user_title = gets.chomp
  @list_of_lists << List.new(user_title)
  puts "New list added. \n\n"
  main
end

def show_list
  puts "Current list of task:"
  @list_of_lists.each_with_index do |list, index|
    puts (index+1).to_s + ": " + list.title
  end
  puts "What list number do you want to edit?"
  input = gets.chomp.to_i
  list_menu(@list_of_lists[input-1])
end

def delete_list
  puts "Which list do you want to delete?"
  @list_of_lists.each_with_index do |list, index|
    puts (index+1).to_s + ": " + list.title
  end
  remove_list = gets.chomp.to_i
  @list_of_lists.delete(@list_of_lists[remove_list-1])
  main
end


def list_menu(list)
  puts "Press 'a' to add a task, 'e' to remove a task, or 'l' to show the list"
  puts "Press 'd' to mark as done or 's' to show done list"
  puts "Press 'p' to sort list by priority, 'n' to sort by name, or 't' to sort by deadline"
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  case main_choice
  when 'a'
    puts list.title
    add_task(list)
  when 'e'
    delete_task(list)
  when 'l'
    list_task(list)
  when 's'
    puts show_done(list)
  when 'd'
    mark_done(list)
  when 'p'
    sort_priority(list)
  when 't'
    sort_due_date(list)
  when 'n'
    sort_name(list)
  when 'x'
    puts "Adios"
  else
    puts "Sorry that's not a valid option."
  end
end

def add_task(list)
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  puts "Please enter the priority of this task in range 1 - 5: "
  user_priority = gets.chomp.to_i
  puts "Please enter the date task needs to be done (yyyy-mm-dd): "
  user_due_date = gets.chomp
  list.add_task(user_description, user_priority, user_due_date)
  puts "Task added.\n\n"
  list_menu(list)
end

def list_task(list)
  puts "Task needed to be done:"
  list.task_list.each_with_index do |task, index|
    date = task.due_date.month.to_s + "/" + task.due_date.day.to_s + "/" + task.due_date.year.to_s
    puts (index+1).to_s + ": " + task.description + " " + date
  end
  puts "\n"
  list_menu(list)
end

def delete_task(list)
  puts "Which task do you want to delete?"
  list.task_list.each_with_index do |task, index|
    puts (index+1).to_s + ": " + task.description
  end
  remove_task = gets.chomp.to_i
  list.task_list.delete(list.task_list[remove_task-1])
  list_menu(list)
end

def mark_done(list)
  puts "Which task do you want removed? (enter list number)"
  list.task_list.each_with_index do |task, index|
    puts (index+1).to_s + ": " + task.description
  end
  remove_task = gets.chomp.to_i
  list.task_list[remove_task-1].done == true
  list.add_done_list(list.task_list[remove_task-1])
  list.task_list.delete(list.task_list[remove_task-1])
  list_menu(list)
end

def show_done(list)
  puts "These are your complete tasks: "
  list.done_list.each do |element|
    puts element.description
  end
  puts "\n\n"
  list_menu(list)
end

def sort_priority(list)
  puts "These are your task sorted by priority: "
  list.sort_by_priority.reverse!
  list.task_list.each_with_index do |task, index|
    date = task.due_date.month.to_s + "/" + task.due_date.day.to_s + "/" + task.due_date.year.to_s
    puts (index+1).to_s + ": " + task.description + " " + date
  end
  list_menu(list)
end

def sort_due_date(list)
  puts "These are your task sorted by due date: "
  list.sort_by_due_date
  list.task_list.each_with_index do |task, index|
    date = task.due_date.month.to_s + "/" + task.due_date.day.to_s + "/" + task.due_date.year.to_s
    puts (index+1).to_s + ": " + task.description + " " + date
  end
  list_menu(list)
end

def sort_name(list)
  puts "These are your task sorted alphabetically: "
  list.sort_by_name
  list.task_list.each_with_index do |task, index|
    date = task.due_date.month.to_s + "/" + task.due_date.day.to_s + "/" + task.due_date.year.to_s
    puts (index+1).to_s + ": " + task.description + " " + date
  end
  list_menu(list)
end
main



