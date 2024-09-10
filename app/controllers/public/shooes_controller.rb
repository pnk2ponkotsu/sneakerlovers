class Public::ShooesController < ApplicationController

  def index
   @shoo = Shoo.new
   #@shoo.user_id = current_user.id
   @shooes = Shoo.all
   @users = User.all
  end

  def show
   @users = User.all
   @shoo = Shoo.new
   @one_shoo = Shoo.find(params[:id])
   @user = @one_shoo.user
  end

  def create
   @shoo = Shoo.new(shoo_params)
   @shoo.user_id = current_user.id
   @shoo.save
    redirect_to shooes_path
  end

  def edit
   @shoo = Shoo.find(params[:id]) 
  end

  def update
   @shoo = Shoo.find(params[:id])
   if @shoo.update(shoo_params)
    redirect_to shoo_path(@shoo), notice: "情報を変更しました。"
   else
    render action: :edit
   end
  end

  def destroy

  end

  private

  def shoo_params
    params.require(:shoo).permit(:title, :body, :image)
  end

end
