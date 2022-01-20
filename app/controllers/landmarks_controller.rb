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

    if !params["figure"]["year_completed"].empty?
      @landmark.figure = figure.create(name: params["figure"]["year_completed"])
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

# get '/landmarks/new' do
#   erb :'/landmarks/new'
# end

# post '/landmarks' do
#   @landmark = Landmark.create(params[:landmark])

#   if !params["landmark"]["name"].empty?
#     @landmark.landmark == Landmark.create(name: params["landmark"]["name"])
#     @landmark.save
#   end

#   if !params["landmark"]["year_completed"].empty?
#     @landmark.landmark == Landmark.create(name: params["landmark"]["year_completed"])
#     @landmark.save
#   end
#   redirect to "landmarks/#{@landmark.id}"
# end


# patch '/figures/:id' do
#   if !params[:figure].keys.include?("title_ids")
#     params[:figure]["title_ids"] = []
#   end
#   if !params[:figure].keys.include?("landmark_ids")
#     params[:figure]["landmark_ids"] = []
#   end
#   @figure = Figure.find(params[:id])
#   @figure.update(params["figure"])
#   if !params["title"]["name"].empty?
#     @figure.titles << Title.create(name: params["title"]["name"])
#     # @figure.save
#   end
#   if !params["landmark"]["name"].empty?
#     @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
#     # @figure.save
#   end
#   redirect "figures/#{@figure.id}"
# end


