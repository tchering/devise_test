class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_path
    else
      @microposts = Micropost.all
      render 'static_pages/home'
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
