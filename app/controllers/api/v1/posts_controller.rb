class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.all
    respond_with @posts
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      respond_with @post, status: 200, location: api_v1_post_url(@post)
    else
      render json: @post.errors, status: 403
    end
  end

  def show
    @post = Post.find params[:id]
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:name, :body)
  end
end
