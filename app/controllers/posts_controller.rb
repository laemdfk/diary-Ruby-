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

  end


  private

  def post_params
    params.require(:post).permit(:title,:body,:post_image)
  end

end
