class PostsController < ApplicationController
  def new
    @post_new = Post.new
  end

  def create
     @post_new = Post.new(post_params)
    # @post_new = Post.new(params[:id])　→→これだとnilが渡る(照合するidがないから？)
     if @post_new.save
      redirect_to post_path(@post_new.id)
      # @post_new.idとすることで、新規に与えられたidをもとに詳細ページへ飛べる
     end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def post_params
    params.require(:post).permit(:title,:body,:post_image)
  end

end
