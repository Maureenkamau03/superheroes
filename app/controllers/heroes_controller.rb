class HeroesController < ApplicationController
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
        hero = Hero.all
        render json: hero, status: :ok, include: :hero_powers
    end


    def show
        hero = Hero.find_by(id: params[:id])
        render json: hero
    end

    private
  
    def record_not_found
        render json: {error: "Hero not found"}, status: :not_found
    end
    

end
