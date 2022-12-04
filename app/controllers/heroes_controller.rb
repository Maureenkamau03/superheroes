class HeroesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        hero = Hero.all
        render json: hero, status: :ok, include: :hero_powers
    end


    def show
        hero = Hero.find_by(id: params[:id])
        if hero
            render json: hero, except:[:created_at, :updated_at], include: :powers
        else
            render json: {error: "Hero not found"}, status: :not_found
        end
    end

end
