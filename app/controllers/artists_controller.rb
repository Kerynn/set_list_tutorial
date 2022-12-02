class ArtistsController < ApplicationController
  def index 
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

  def artist_params 
    params.permit(:name)
  end 
end 