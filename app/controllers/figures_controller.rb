class FiguresController < ApplicationController

  get '/figures' do
    erb :index
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["name"])
    redirect to "/figures/#{@figure.slug}"
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :"/figures/#{@figure.slug}"
  end
end
