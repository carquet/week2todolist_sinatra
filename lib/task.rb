class Task
    attr_reader :content, :id, :update_at, :created_at
    @@current_id = 1
    def initialize(content, created_at)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = Time.now
        @update_at = nil
    end

    def completed?
    	@completed 
    	
    end

    def complete!
    	@completed = true
    end

    def update_content!(update)
    	@update_at = Time.now
        @content = update

    end
end