class UsersController < ApplicationController
  def index
    @users = User.top_karma_users
  end
end
