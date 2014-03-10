require 'date'

class Task
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

