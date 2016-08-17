require "sinatra"
require_relative 'lib/todolist.rb'
require_relative 'lib/task.rb'
require 'sinatra/reloader' if development?

todo_list = TodoList.new("Josh")
task1 =Task.new("Walk the dog!", Time.now)
task2 = Task.new("Walk the husband", Time.now)
todo_list.add_task(task1)
todo_list.add_task(task2)

get "/tasks" do
	@todo_list = todo_list.tasks
	erb :task_index
end

get "/new_task" do
	erb :new_task
	end