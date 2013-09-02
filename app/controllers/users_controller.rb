class UsersController < ApplicationController
  def index
    @users = User.by_karma.limit(50)
  end

  def page
    @users = User.by_karma.page(params[:page])
  end
end
