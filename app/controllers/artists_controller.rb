class ArtistsController < ApplicationController

    set :views, "app/views/artists"

  get "/artists" do

    erb :index
  end

  get "/artists/new" do

    erb :new
  end

  get "/artists/:slug" do

    erb :show
  end

end
