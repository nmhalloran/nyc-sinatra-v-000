class FiguresController < ApplicationController

  get '/figures' do
    erb :index
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.title_ids = params["figure"]["title_ids"]
    if !params["title"]["name"].empty? && !Title.all.detect {|title| title.name == params["title"]["name"]}
      @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    end
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    @figure.save
    redirect to "/figures/#{@figure.slug}"
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :"/figures/show"
  end
end
