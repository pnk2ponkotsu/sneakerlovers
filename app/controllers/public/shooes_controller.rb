class Public::ShooesController < ApplicationController

  def index
    @shoo = Shoo.new
  end

  def show

  end

  def create
    @shoo = Shoo.new(shoo_params)
    @shoo.save
    redirect_to '/users'
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  
  def shoo_params
    params.require(:shoo).permit(:title, :body)
  end

end
