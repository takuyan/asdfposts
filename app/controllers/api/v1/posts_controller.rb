module Api::V1
  class PostsController < BaseController
    def index
      @posts = Post.all.page(params[:page]).per(100)
      render json: @posts,
        meta: {
          total_count: @posts.total_count,
          total_pates: @posts.total_pages,
          current_page: @posts.current_page,
          per_page: 100
        },
        each_serializer: PostSerializer
    end

    def create
      @post = Post.new post_params
      @post.user = current_user
      if @post.save
        render json: @post, status: 200, location: api_v1_post_url(@post)
      else
        render json: @post.errors, status: 403
      end
    end

    def show
      @post = Post.find params[:id]
      render json: @post
    end

    private

    def post_params
      params.require(:post).permit(:name, :body)
    end
  end
end
