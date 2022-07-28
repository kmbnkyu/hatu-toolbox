class ToppagesController < ApplicationController
  def index
    if logged_in?
      @pagy, @memos = pagy(current_user.memos.order(id: :desc), items: 6)
    end
  end
end
