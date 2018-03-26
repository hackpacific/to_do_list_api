class TasksController < ApplicationController
  before_action :validate_user

  def show
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    return render 'tasks/not_found', status: :not_found if not @task
    render 'tasks/show', status: :ok
  end

  def index
    user = User.find_by(id: params[:api_key])
    @tasks = user.tasks.all
    render 'tasks/index', status: :ok
  end

  def create
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.new(task_params)

    return render 'tasks/bad_request', status: :bad_request if not @task.save
    render 'tasks/create', status: :created
  end

  def destroy
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    return render 'tasks/not_found', status: :not_found if not @task
    return render 'tasks/bad_request', status: :bad_request if not @task.destroy
    render json: { success: true }, status: :ok
  end

  def update
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    return render 'tasks/not_found', status: :not_found if not @task
    return render 'tasks/bad_request', status: :bad_request if not @task.update(task_params)
    render 'tasks/show', status: :ok
  end

  def mark_complete
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    return render 'tasks/not_found', status: :not_found if not @task
    return render 'tasks/bad_request', status: :bad_request if not @task.update(completed: true)
    render 'tasks/show', status: :ok
  end

  def mark_active
    user = User.find_by(id: params[:api_key])
    @task = user.tasks.find_by(id: params[:id])

    return render 'tasks/not_found', status: :not_found if not @task
    return render 'tasks/bad_request', status: :bad_request if not @task.update(completed: false)
    render 'tasks/show', status: :ok
  end

  private

  def task_params
    params.require(:task).permit(:content, :due)
  end

  def validate_user
    user = User.find_by(id: params[:api_key])
    return render json: {
      status: '401',
      title:  'Unauthorized User',
      detail: 'User is not found.'
    }, status: :unauthorized unless user

    if user
      return true
    else
      return false
    end
  end
end
