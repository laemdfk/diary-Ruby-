class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # whereにより、投稿したユーザーのデータのみを出力させる
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")

  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

     if @user.update(user_params)
        flash[:notice]="You have updated successfully."
        redirect_to mypage_path

     else
        render "edit"
     end
  end



def mypage
  @user = current_user
end



def quit
    @user = current_user
end


def withdrawal
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行いたしました。ご利用いただき、誠にありがとうございました"
 end

 private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def post_params
    params.require(:post).permit(:title,:body,:image)
  end

end
