module Tasks
  class UpdateService
    def initialize(task, params)
      @task = task
      @params = params
    end

    def execute
      validate!

      update_task
    end

    private
    attr_reader :params, :task

    def validate!
      validate_due_date
    end

    def validate_due_date
      return unless params[:due_date]
      raise 'The due date must be greater than the current time' if due_date < Time.now()
    end

    def update_task
      task.title = params[:title] if params[:title]
      task.subtitle = params[:subtitle] if params[:subtitle]
      task.due_date = due_date if params[:due_date]
      task.priority = params[:priority] if params[:priority]
      task.completed = params[:completed] unless params[:completed].nil?
      task.save!
    end

    def due_date
      @due_date ||= begin
      Time.at(params[:due_date]).to_datetime
      rescue StandardError
        Time.parse params[:due_date]
      end
    end
  end
end