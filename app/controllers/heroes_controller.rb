class HeroesController < ApplicationController
    def index
        hero = Hero.all
        render json: hero, except:[:created_at, :updated_at], status: :ok
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
