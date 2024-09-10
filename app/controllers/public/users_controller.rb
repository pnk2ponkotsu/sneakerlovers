class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user,only: [:edit, :update]

  def index
   @users = User.all
   @shoo =Shoo.new
   #@user = User.find(params[:id])
  end

  def show
   @users = User.all
   @user = User.find(params[:id])
   @shooes = @user.shooes
   @shoo = Shoo.new
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user), notice: "情報を変更しました。"
   else
    render action: :edit
   end
  end

private

  def user_params
   params.require(:user).permit(:name, :image)
  end

  def baria_user
   unless params[:id].to_i == current_user.id
    redirect_to user_path(current_user)
   end
  end
end