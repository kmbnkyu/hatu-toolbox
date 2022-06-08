class MemosController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy, @memos = pagy(current_user.memos.order(id: :desc), items: 25)
  end

  def show
  end

  def new
    @memo = current_user.memos.build
  end

  def create
    @memo = current_user.memos.build(memo_params)

    if @memo.save
      flash[:success] = 'メモが作成されました'
      redirect_to @memo
    else
      flash.now[:danger] = '作成できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      flash[:success] = '更新されました'
      redirect_to @memo
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @memo.destroy

    flash[:success] = '削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def memo_params
    params.require(:memo).permit(:content, :title)
  end
  
  def correct_user
    @memo = current_user.memos.find_by(id: params[:id])
    unless @memo
      redirect_to root_url
    end
  end
end
