class Api::V1::CommentsController < ApplicationController
  force_ssl unless Rails.env.development?

  respond_to :json, :xml

  before_action :authenticate, except: [:index, :show]

  def index
    respond_with Comment.all
  end

  def show
    respond_with Comment.find(params[:id])
  end

  def create
    respond_with Comment.create(comment_params)
  end

  def update
    respond_with Comment.update(params[:id], comment_params)
  end

  def destroy
    respond_with Comment.destroy(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :body, :author_name)
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(token: token)
    end
  end

end
