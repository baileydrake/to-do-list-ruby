require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('pet the llama')
    test_task.should be_an_instance_of Task
  end
  it 'shows the description given' do
    test_task = Task.new('pet the llama')
    test_task.description.should eq 'pet the llama'
  end
  # it 'adds a priority number to the task' do
  #   test_task = Task.new('annoy the lion')
  #   test_task.priority.should eq 0
  # end
  # it 'adds a priority number to the task' do
  #   test_task = Task.new('stroke the giraffe', 2)
  #   test_task.priority.should eq 2
  # end
end

describe List do
  it 'is initialized with a list' do
    test_list = List.new('chores')
    test_list.should be_an_instance_of List
  end

  it 'show the the description of the list' do
    test_list = List.new('chores')
    test_list.title.should eq('chores')
  end

  it 'should have an array of task objects' do
    test_list = List.new('chores')
    test_task = Task.new('water the plants')
    test_list.add_task(test_task)
    test_list.task_list.length.should eq(1)
   end

   it 'shuld sort task by priority' do
    test_lit = List.new('chores')
    test_task = Task.new('plant the tree', 2)
    test_task = Task.new('water the hippo', 5)
    test_list.sort.should eql(['water the hippo', 'plant the tree'])
end
