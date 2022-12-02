class ArtistsController < ApplicationController
  def index 
    binding.pry
    @artists = Artist.all
  end 

  def show 
    @artist = Artist.find(params[:artist_id])
  end 

  def new 
  end 

  def create 
    artist = Artist.create(artist_params)
    redirect_to "/artists"

    # IF following actual test from beginning of forms video: redirect_to "/artists/#{artist.id}"
  end 

  def edit 
    @artist = Artist.find(params[:id])
  end 

  def update 
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end 

  def destroy 
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to '/artists'
  end 

private
  def artist_params 
    params.permit(:name)
  end 
end 