class FiguresController < ApplicationController
  # add controller methods


  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end
  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    
    erb :"figures/edit"
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end

  

  patch '/figures/:id' do 
    
    figure = Figure.find(params[:id])
    figure.update(name: params[:figure][:name])
    landmark = Landmark.create(params[:landmark])
    figure.landmarks << landmark


   
    redirect "/figures/#{figure.id}"
  end

  post '/figures' do 
    
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      figure = Figure.create(name: params[:figure][:name])
      figure.titles << title 
    

    elsif !params[:landmark][:name].empty?
     
      landmark = Landmark.create(params[:landmark])
      figure = Figure.create(name: params[:figure][:name])
      figure.landmarks << landmark
      

    elsif !params[:figure][:landmark_ids] || !params[:figure][:title_ids]
        Figure.create(params[:figure])
    end
  
    redirect "/figures/#{Figure.last.id}"
  end
end
