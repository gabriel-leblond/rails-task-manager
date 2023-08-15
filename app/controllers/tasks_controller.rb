class TasksController < ApplicationController
  before_action :index

  def show
    @task = @task = @tasks.find { |task| task['id'] == params[:id].to_i }
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Restaurant.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def index
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
