class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def done
    @done = false
  end
end

class List
  def initialize(title)
    @title = title
    @tasks = []
  end

  def title
    @title
  end

  def show_tasks
    @tasks
  end

  def add_task
    puts "Enter a description of the new task:"
    user_description = gets.chomp
    new_task = Task.create(user_description)
    @tasks << new_task
  end
end
