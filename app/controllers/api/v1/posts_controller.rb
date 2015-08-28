class Api::V1::PostsController < ApplicationController
  before_action :doorkeeper_authorize!

  respond_to :json

  def index
    @posts = Post.all
    respond_with @posts
  end
end
