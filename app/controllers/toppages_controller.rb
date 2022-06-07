class ToppagesController < ApplicationController
  def index
    if logged_in?
      @memo = current_user.memos.build  # form_with 用
      @pagy, @memos = pagy(current_user.memos.order(id: :desc))
    end
  end
end
