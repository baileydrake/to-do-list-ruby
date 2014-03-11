require 'rspec'
require 'task'
require 'list'

describe Task do

  before do
    Task.clear
  end
  describe '.clear' do
    it 'empties out all of that saved tasks' do
      Task.new('wash the lion', '2014-03-10').save
      Task.clear
      Task.all.should eq []
    end
  end
  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
   end
 end
 describe '#save' do
  it 'adds a task to the array of saved tasks' do
    test_task = Task.new('clean the llama', '2014-03-10')
    test_task.save
    Task.all.should eq [test_task]
    end
  end
  describe '.create' do
    it 'makes a new instance of Task' do
      test_task = Task.create('wash the lion', '2014-03-10')
      test_task.should be_an_instance_of Task
    end

    it 'saves the Task' do
      test_task = Task.create('wash the lion', '2014-03-10')
      Task.all.should eq [test_task]
    end
  end
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
    test_task = Task.new('water the plants', '2014-03-10')
    test_list.task_list.length.should eq(1)
   end

   it 'should sort task by priority' do
    test_list = List.new('chores')
    test_task = Task.new('plant the tree', 2, '2014-03-10')
    test_task = Task.new('water the hippo', 5, '2014-03-10')
    test_list.sort_by_priority.should eql(['water the hippo', 'plant the tree'])
end
end
