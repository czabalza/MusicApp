class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album
      @album.destroy
      redirect_to bands_url
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to :bands_url
    end
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end
end
