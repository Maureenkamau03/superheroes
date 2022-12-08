class HeroPowersController < ApplicationController
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method

    def index
        hero_powers = HeroPower.all
        render json: hero_powers, status: :ok
    end

    def create
        hero_powers = HeroPower.create(hero_params)
        render json: hero_powers, status: :created  
       
    end


    private

    def hero_params
        params.permit(:strength, :power_id, :hero_id)
    end
    def unprocessable_entity_method entity
        render json: {errors: entity.record.errors}, status: :unprocessable_entity
    end
    
end
