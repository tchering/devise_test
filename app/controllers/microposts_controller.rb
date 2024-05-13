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

  def destroy
    @micropost = Micropost.find(params[:id])
    if current_user = @micropost.user
      @micropost.destroy
      flash[:success] = 'Micropost deleted'
      redirect_to root_path
    else
      flash[:danger] = 'You can only delete your own micropost'
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
