
class TodoList
	attr_reader :tasks
	def initialize tasks
		@tasks = []
	end
    
    def add_task(task)
        @tasks.push(task)
    end

    def delete_task(id)
        @tasks.delete_if do |task|
          task.id == id
        end
    end
   # def find_by_id(id)
   #  found_task = @tasks.find do |task|
   #      task.id == id
   #      end
   #      found_task
   #  end   
        
    def find_by_id(id)
        found_task = nil
        @tasks.each do |task|
            if task.id == id
                found_task = task
            end
        end
        found_task
    end
    def sort_by_created
        @tasks.sort do |task1, task2|
            task2.created_at <=> task1.created_at 
        end
    end

end
