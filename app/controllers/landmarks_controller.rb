class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  get '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    erb :"/landmarks/show"
  end

  get '/landmarks/:slug/edit' do
    @landmark = Landmark.find_by_slug(params[:slug])
    erb :"/landmarks/edit"
  end

  post '/landmarks' do
    redirect to "/landmarks/#{@landmark.slug}"
  end

  post '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    redirect to "/landmarks/#{@landmark.slug}"
  end
end
