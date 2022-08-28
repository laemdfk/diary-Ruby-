class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = Post.all
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

     if @user.update(user_params)
        flash[:notice]="You have updated successfully."
        redirect_to mypage_path(@user.id)

     else
        render "edit"
     end

  end


  def mypage
    @user = current_user
  end


 private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
