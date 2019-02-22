class GenresController < Sinatra::Base

    set :views, "app/views/genres"

  get "/genres" do

    erb :index
  end

  get "/genres/new" do

    erb :new
  end

  get "/genres/:slug" do

    erb :show
  end

end
