class PostsController < ApplicationController
  def index
  @posts = Post.all
  end
  
  def show
  @post = Post.find(params[:id]) 
  end
  
  def new
  end
  
  def edit
  @post = Post.find(params[:id]) 
  end

  def create
  @post = Post.new(post_params)
  if @post.save
    flash[:success] = "Your post added!"
   redirect_to @post  
  else
   render 'new'
  end  
end

  def update
  @post = Post.find(params[:id])
 if @post.update(post_params)
   flash[:success] = "Your post updated!"
  redirect_to @post

 else
 redirect_to 'edit' 
  end 
  end

  def destroy
  @post = Post.find(params[:id])
  flash[:success] = "Your post deleted!"
  @post.destroy 
  redirect_to posts_path
  end
  
  private 
  def post_params
  params.require(:post).permit(:title,:text)
  end
end
