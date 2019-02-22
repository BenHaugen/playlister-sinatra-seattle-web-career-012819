class GenresController < Sinatra::Base

    set :views, "app/views/genres"

  get "/genres" do

    erb :index
  end

  get "/genres/new" do

    erb :new
  end

  get "/genres/:slug" do

    @this_genre = Genre.all.find do |genre|
      genre.slug == params[:slug]
    end

    @song_genre = SongGenre.find(@this_genre.id)

    @song = Song.all.find do |song|
      song.id == @song_genre.song_id
    end

    @artist = Artist.all.find do |artist|
      artist.id == @song.artist_id
    end

    erb :show
  end

end
