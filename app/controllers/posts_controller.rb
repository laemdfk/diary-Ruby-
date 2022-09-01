class PostsController < ApplicationController

  def new
    @post_new = Post.new
  end

  def create
     @post_new = Post.new(post_params)
    # @post_new = Post.new(params[:id])　→→これだとnilが渡る(照合するidがないから？)

    # 感情分析スコアの作成
    @post_new.score = Language.get_data(post_params[:body])

     if @post_new.user_id = current_user.id
      @post_new.save

      # tags = Vision.get_image_data(@post_new.image)
      #   tags.each do |tag|
      #   @post_new.tags.create(name: tag)
      #   end



      redirect_to post_path(@post_new.id)
      # @post_new.idとすることで、新規に与えられたidをもとに詳細ページへ飛べる
     end
  end

  def index
    # whereにより、投稿したユーザーのデータのみを出力させる
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])

     if @post.update(post_params)
        flash[:notice]="You have updated successfully."
        redirect_to post_path(@post.id)

     else
        render "edit"
     end

  end

  def destroy
    post = Post.find(params[:id])

    post.destroy
      flash[:notice]="Post was successfully destroyed."
      redirect_to posts_path

  end


  private

  def post_params
    params.require(:post).permit(:title,:body,:image)
  end

end
