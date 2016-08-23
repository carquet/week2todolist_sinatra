require "sinatra"
require_relative 'lib/todolist.rb'
require_relative 'lib/task.rb'
require 'sinatra/reloader' if development?
require 'pry'

todo_list = TodoList.new("Josh")
task1 =Task.new("Walk the dog!")
task2 = Task.new("Walk the husband")
todo_list.add_task(task1)
todo_list.add_task(task2)

get "/tasks" do
	@todo_list = todo_list.tasks
	erb :task_index
end


get "/new_task" do 
	erb :new_task
end
#params creates an hash of key and value.Key being named in the erb doc and value given by the user.
post "/create_task" do 
	new_content = params[:content]
	task = Task.new(new_content)
	todo_list.add_task(task)
	redirect "/tasks"
end

get "/complete/:id" do
	task_id = params[:id].to_i
	@task_found = todo_list.find_by_id(task_id)
	@task_found.complete!
	erb(:show)
	# redirect "/tasks"
	#find one specific  task from todo_list 
	#mark it as complete
	#redirect the user to the our list of tasks
	#when we return there should be a mark that the task is complete.
end
