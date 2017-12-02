class TasksController < ApplicationController
  #before_action :set_params, only:[:show, :edit, :update, :destroy]
  before_action :set_params, only:[:show, :edit]
  before_action :correct_user, only:[:show, :edit, :update, :destroy]

  #画面必要
  def index
    @tasks = Task.all.page(params[:page]).per(15)
  end

  #画面必要
  def show
    #set_params
    #@task = Task.find(params[:id])
    @user = User.find_by(id: current_user)
  end

  #画面必要
  def new
    @task = Task.new
  end

  def create
    #@task = Task.new(post_params)
    @task = current_user.tasks.build(post_params)

    if @task.save
      flash[:success] = "The registration is succeeded"
      redirect_to @task

      #TBD
      #redirect_to root_path
    else
      flash.now[:danger] = "The registration is failed"
      render :new
    end
  end

  #画面必要
  def edit
    set_params
    #@task = Task.find(params[:id])
    @user = User.find_by(id: current_user)
  end

  def update
    @task = current_user.tasks.build(post_params)
    #set_params
    #@task = Task.find(params[:id])
    
    if @task.update(post_params)
      flash[:success] = "The registration is succeeded"

      #showアクションではなく、一覧へ遷移するようにした
      redirect_to user_path(current_user)
    
    else
      flash.now[:danger] = "The registration is failed"
      render :edit
    end  
  end

  def destroy
    #correct_user
    #set_params
    #@task = Task.find(params[:id])
    #@task = Task.find_by(id: current_user)
    @task.destroy
    
    flash[:success] = "The task is deleted"
    #redirect_back(fallback_location: root_path)
    #redirect_to root_url
    redirect_to user_path(current_user)
  end

  private
  
  def set_params
    @task = Task.find(params[:id])
  end

  def post_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    #redirect_to root_url if @task.user != current_user
    unless @task
      redirect_to root_url
    end
  end
end
