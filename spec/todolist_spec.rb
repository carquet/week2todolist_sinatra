require_relative '../lib/task.rb'
require_relative '../lib/todolist.rb'

RSpec.describe "Todolist test"  do 
    let(:todolist1) {TodoList.new}
    let(:task1) {Task.new("walk the dog")}
    let(:task2) {Task.new("drink vodka with gin with whisky and no cola")}


	it "check whether the task is complete" do
		expect(task1.completed?).to eq(false)
	end
	it "change the completion status to completed" do
		expect(task1.complete!).to eq(true)
	end
	it "update content with new content" do
		expect(task1.update_content!("buy milk")).to eq("buy milk")
	end
	it "add new task to the todolist" do
        todolist1.add_task(task1)
        expect(todolist1.tasks.include? task1).to eq(true)
    end
    it "remove a task from the todolist" do
        todolist1.delete_task(1)
        expect(todolist1.tasks.include? task1).to eq(false)
    end
    it "find a task according to id" do
        todolist1.add_task(task1)
        expect(todolist1.find_by_id(6)).to eq(task1)
    end
    it "find a task according to id" do
        todolist1.add_task(task1)
        expect(todolist1.find_by_id(8)).to eq(nil)
    end
    it "sort the tasks by their created date" do
        todolist1.add_task(task1)
        todolist1.add_task(task2)
        expect(todolist1.sort_by_created[0]).to be(task2)
    end
end
