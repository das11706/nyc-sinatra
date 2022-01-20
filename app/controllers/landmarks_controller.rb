class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    # binding.pry
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    # binding.pry
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    if !params["figure"]["name"].empty?
      @landmark.figure = Figure.create(name: params["figure"]["name"])
      @landmark.save
    end

    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @figures = Figure.all
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    if !params[:landmark].keys.include?("figure_id")
    params[:landmark]["figure_id"] = []
    end
    @landmark = Landmark.find(params[:id])

    @landmark.update(params["landmark"])
    if !params["figure"]["name"].empty?
      @landmark.figure = Figure.create(name: params["figure"]["name"])
      @landmark.save
    end
    redirect "landmarks/#{@landmark.id}"
  end
end

