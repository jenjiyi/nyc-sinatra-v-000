class LandmarksController < ApplicationController
#  allows you to view form to create a new landmark (FAILED - 1)
  # allows you to create a new landmark (FAILED - 2)
  # allows you to list all landmarks (FAILED - 3)
  # allows you to see a single landmark (FAILED - 4)
  # allows you to view form edit a single landmark (FAILED - 5)
  # allows you to edit a single landmark (FAILED - 6)
  get '/' do
    redirect '/landmarks'
  end

  get '/landmarks' do 
    erb :'landmarks/index'

  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
  
  post '/landmarks' do
    Landmark.create(:name => params["landmark"]["name"], :year_completed => params["landmark"]["year_completed"])
    erb :'/landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    # @landmark.name = params["landmark"]["name"]
    # @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end



end
