class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = '登録情報を更新しました。'
      redirect_to @user
      #更新に成功した場合を扱う
    else
      flash.now[:danger] = '更新されませんでした'
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:success] = '退会（登録情報削除）できました。'
    redirect_to root_url
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to root_url
    end
  end
end
