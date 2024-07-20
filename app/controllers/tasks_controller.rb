class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_task, only: %i[update destroy]

  def index
    tasks = ::TasksFinder.new(params).execute
    render_collection(data: tasks, serializer: TaskSerializer)
  end

  def create
    task = ::Tasks::CreateService.new(task_params).execute
    render_resource(data: task, serializer: TaskSerializer)
  end

  def update
    ::Tasks::UpdateService.new(@task, task_params).execute
    render_resource(data: @task.reload, serializer: TaskSerializer)
  end

  def destroy
    @task.destroy!
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.permit(:title, :subtitle, :due_date, :priority, :completed)
  end
end
