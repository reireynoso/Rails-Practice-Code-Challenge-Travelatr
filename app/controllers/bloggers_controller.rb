class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(params.require(:blogger).permit(:name, :bio, :age))
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      # byebug
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path
    end
    # redirect_to bloggers_path
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
    @blogger.update(params.require(:blogger).permit(:name, :age, :bio))
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      # byebug
      flash[:errors] = @blogger.errors.full_messages
      redirect_to edit_blogger_path
    end
  end

  def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.destroy
    redirect_to bloggers_path
  end
end
