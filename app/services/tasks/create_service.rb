module Tasks
  class CreateService
    def initialize(params)
      @params = params
    end

    def execute
      validate!

      create_task
    end

    private
    attr_reader :params

    def validate!
      validate_due_date
    end

    def validate_due_date
      raise 'The due date must be greater than the current time' if due_date < Time.now()
    end

    def create_task
      Task.create!(
        title: params[:title],
        subtitle: params[:subtitle],
        due_date: due_date,
        priority: params[:priority] || Task.priorities[:low]
      )
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