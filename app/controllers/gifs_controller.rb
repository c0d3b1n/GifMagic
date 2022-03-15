class GifsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gifs = current_user.gifs
  end

  def new
  end

  def create
    # gif = Gif.create(gif_params)
    current_user.gifs.create(gif_params)
    redirect_to root_path
  end

  private

  def gif_params
    params.require(:gif).permit(:name, :description, :file)
  end
end