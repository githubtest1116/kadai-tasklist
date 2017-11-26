class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  
  
  #画面必要
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  #画面必要
  def show
    #before_action
  end

  #画面必要
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(post_params)
    
    if @user.save
      flash[:success] = "ユーザの登録が完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザの登録に失敗しました"
      render :new
    end
  end

  #画面必要
  def edit
    #before_action
  end
  
  #？？？なぜかパスワードがブランクでも登録できちゃう？？？あと、flashメッセージが表示されない
  def update
    #before_action
    
    if @user.update(post_params)
      flash[:success] = "登録情報を更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "登録情報の更新が出来ませんでした"
      render :edit
    end
  end
  
  def destroy
    #before_action
    
    @user.destroy
    
    flash[:success] = "登録情報を削除しました"
    redirect_to root_url
  end
  
  private
  
  def set_params
    @user = User.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
