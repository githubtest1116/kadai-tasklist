class TasksController < ApplicationController
  #画面必要
  def index
    @tasks = Task.all
  end

  #画面必要
  def show
    @task = Task.find(params[:id])
  end

  #画面必要
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(post_params)

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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(post_params)
      flash[:success] = "The registration is succeeded"

      #showアクションではなく、一覧へ遷移するようにした
      redirect_to root_path
    
    else
      flash.now[:danger] = "The registration is failed"
      render :edit
    end  
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "The task is deleted"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:task).permit(:content)
  end
end
