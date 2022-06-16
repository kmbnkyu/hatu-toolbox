class SearchesController < ApplicationController
  before_action :require_user_logged_in
  
  def search
      @memos = Memo.looks(params[:word])
      @memos = current_user.memos.where("title LIKE ?","%#{params[:word]}%")
  end
end
