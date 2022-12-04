class HeroPowersController < ApplicationController
skip_before_action :verify_authenticity_token


    def index
        hero_powers = HeroPower.all
        render json: hero_powers, except:[:created_at, :updated_at]
    end


    def create
        hero_powers = HeroPower.create(hero_params)
        if hero_powers.valid?
        render json: hero_powers, status: :created  
        else
        render json: {errors: hero_powers.errors}, status: :unprocessable_entity    
        end
    end


    private

    def hero_params
        params.permit(:strength, :power_id, :hero_id)
    end
    
end
