class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = Post.all
  end

  def edit
  end
  
  def index
  end
  
  
end
