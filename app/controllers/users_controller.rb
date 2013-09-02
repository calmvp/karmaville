class UsersController < ApplicationController
  def index
    @num_pages = User.all.length / 1000
    @page_num = params[:page].to_i
    @users = User.by_karma.page(@page_num)
  end

end

