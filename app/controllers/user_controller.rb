class UserController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    # respond_with User.find(params[:id])
    @user = User.find(params[:id])
    # @route = Route.where(users_id: @user.id)
    render json: @user.to_json
  end

  # for browsing a collection of users: pass in '?offset=5' for 6-10
  def index
    @users_count = User.count
    @users = User.limit(5).offset(params[:offset])
    data = {
      "users" => @users,
      "count" => @users_count
    }
    render json: data.to_json
  end
end
