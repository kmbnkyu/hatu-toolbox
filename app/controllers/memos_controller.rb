class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  
  def index
    @memos = Memo.all
  end

  def show
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(message_params)

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
    if @memo.update(message_params)
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
    redirect_to memos_url
  end
  
  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:content)
  end
end
