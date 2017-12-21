class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
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
    if !params["landmark"]["name"].empty? && !Landmark.all.detect {|landmark| landmark.name == params["landmark"]["name"]}
      @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
end
