class UsersController < ApplicationController
  def index
    page_num = params[:page].to_i
    @users = User.by_karma.page(page_num )
  end

  def page
    @users = User.by_karma.page(params[:page])
  end
end
