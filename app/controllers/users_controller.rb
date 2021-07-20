class UsersController < ApplicationController
  before_action :get_user, only: %i[update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  def show
  end

  private

  def user_params
    params.require(:users).permit(:first_name, :last_name)
  end

  def get_user
    @user = User.find params[:id]
  end
end
