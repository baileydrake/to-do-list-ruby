require './lib/task'

class List
  def initialize(title)
    @title = title
    @task_list = []
    @done_list = []

  end

  def title
    @title
  end

  def task_list
    @task_list
  end

  def add_task(description, priority=1, due_date)
    @task_list << Task.new(description, priority, due_date)
  end

  def done_list
    @done_list
  end

  def add_done_list(task)
    @done_list << task
  end

  def delete_task(task)
    @task_list.delete(task)
    @priority_values.delete(task.description)
  end

  def sort_by_priority
    task_list.sort_by! {|task| task.priority}
  end

  def sort_by_name
    task_list.sort_by! {|task| task.description}
  end

  def sort_by_due_date
    task_list.sort_by! {|task| task.due_date}
  end
end


