class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.create(params.require(:post).permit(:title, :content,:likes, :blogger_id, :destination_id))
    redirect_to posts_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
