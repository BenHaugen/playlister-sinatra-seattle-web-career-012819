require "pry"
class SongsController < Sinatra::Base

  set :views, "app/views/songs"

  get "/songs" do

    erb :index
  end

  get "/songs/new" do

    erb :new
  end

  get "/songs/:slug" do

    @this_song = Song.all.find do |song|
      song.slug == params[:slug]
    end

    @artist = Artist.all.find do |artist|
      artist.id == @this_song.artist_id
    end

    @song_genre = SongGenre.find(@this_song.id)
    @genre = Genre.find(@song_genre.id)



    erb :show
  end

end
