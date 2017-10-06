class TasksController < ApplicationController
  before_action :validate_user

  def index
    user = User.find_by(id: params[:api_key])
    @tasks = user.tasks.all
    render 'tasks/index' # can be omitted
  end

  def create
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.new(task_params)

    if @task.save
      render 'tasks/create' # can be omitted
    end
  end

  def destroy
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    if @task and @task.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def mark_complete
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    if @task and @task.update(completed: true)
      render 'tasks/update'
    end
  end

  def mark_active
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    if @task and @task.update(completed: false)
      render 'tasks/update'
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end

  def validate_user
    user = User.find(params[:api_key])
    return render json: { success: false }, status: :unauthorized unless user

    if user
      return true
    else
      return false
    end
  end
end
