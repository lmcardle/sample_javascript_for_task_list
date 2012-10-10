class TasksController < ApplicationController
  def index
    @incomplete_tasks = Task.where(complete: !true)
    @completed_tasks = Task.where(complete: true)
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    @task.complete = false
    @task.save!
    redirect_to tasks_url
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task])
    redirect_to tasks_url
  end
  
  def destroy
    @task = Task.destroy(params[:id])
    redirect_to tasks_url
  end
end
