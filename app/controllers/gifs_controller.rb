class GifsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gifs = current_user.gifs
  end

  def new
  end

  def create
    error_message = validate_file

    unless error_message
      current_user.gifs.create(gif_params)
      flash[:success] = "Gif have been successfully uploaded"
      redirect_to root_path
    else
      flash.now[:error] = error_message
      render action: :new
    end
  end

  private

  def gif_params
    params.require(:gif).permit(:name, :description, :file)
  end

  def validate_file
    file_size = gif_params[:file].size/(1024**2)
    file_type = gif_params[:file].content_type
    if file_size > 0 
      return "File size is greater than 1 MB"
    elsif !file_type.eql?("image/gif")
      return "File type is not valid"
    end
  end
end