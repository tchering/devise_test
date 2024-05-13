class UsersController < ApplicationController
  before_action :find_user, only: %i[show]
  def index
    @users = User.all
  end

  def show
    @microposts = @user.microposts
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
