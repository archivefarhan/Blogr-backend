class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    posts = Post.all
    render json: posts.as_json
  end

  def create
    post = Post.new(
      user_id: current_user.id,
      title: params[:title],
      body: params[:body],
      image: params[:image],
    )
    if post.save
      render json: post.as_json
    else
      render json: { errors: post.errors.full_messages }, status: :bad_request
    end
  end

  def show
    id = params[:id]
    post = Post.find(id)
    render json: post.as_json
  end

  def update
    id = params[:id]
    post = Post.find(id)

    post.update(
      post.title = params[:title] || post.title,
      post.body = params[:body] || post.body,
      post.image = params[:image] || post.image
    )

    if post.save
      render json: post.as_json
    else
      render json: { errors: post.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    id = params[:id]
    post = Post.find(id)

    post.destroy

    render json: { message: "Post successfully destroyed!" }
  end
end
