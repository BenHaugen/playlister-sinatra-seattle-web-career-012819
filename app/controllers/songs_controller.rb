class SongsController < ApplicationController

  set :views, "app/views/songs"

  get "/songs" do

    erb :index
  end

  get "/songs/new" do

    erb :new
  end

  get "/songs/:slug" do

    erb :show
  end

end
