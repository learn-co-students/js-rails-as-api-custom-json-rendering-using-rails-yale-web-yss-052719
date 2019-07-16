class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
    render json: birds, only: [:id, :name, :species]
    # selecting what to send
    # option 2: render json: birds, except: [:created_at, :updated_at]
    else
      render json: {message: 'Bird not found' }
    end
  end
end
