class ArtistsController < Sinatra::Base

    set :views, "app/views/artists"

  get "/artists" do

    erb :index
  end

  get "/artists/new" do

    erb :new
  end

  get "/artists/:slug" do

    @this_artist = Artist.all.find do |artist|
      artist.slug == params[:slug]
    end


    @song = Song.all.find do |song|
      song.artist_id == @this_artist.id
    end

    @song_genre = SongGenre.find(@this_artist.id)
    @genre = Genre.find(@song_genre.id)
    erb :show
  end

end
