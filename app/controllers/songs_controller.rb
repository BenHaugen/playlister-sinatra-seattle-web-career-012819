class SongsController < ApplicationController

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
