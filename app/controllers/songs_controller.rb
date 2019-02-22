require "pry"
class SongsController < Sinatra::Base

  set :views, "app/views/songs"

  get "/songs" do

    erb :index
  end

  get "/songs/new" do
    @songs = Song.all

    erb :new
  end

  post "/songs" do
    song = Song.new
    binding.pry
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    song.name = params[:Name]
    Genre.find_or_create_by(name: params[:genre_name])
    song.save
    redirect "/songs/:slug"

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
