require 'date'

class Task

  @@all_tasks = []

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks = []
  end

  def Task.create(description, priority=1, due_date)
    new_task = Task.new(description, priority, due_date)
    @@all_tasks << new_task
    new_task
  end

  def save
    @@all_tasks << self
  end

  def initialize(description, priority=1, due_date)
    @description = description
    @priority = priority
    @due_date = Date.parse(due_date)
  end

  def description
    @description
  end

  def done
    @done = false
  end

  def priority
    @priority
  end

  def due_date
    @due_date
  end
end

