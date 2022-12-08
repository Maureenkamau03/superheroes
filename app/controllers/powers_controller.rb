class PowersController < ApplicationController
 skip_before_action :verify_authenticity_token
 wrap_parameters format:[]

    def index
    power = Power.all
    render json: power
    end

    def show
        power = Power.find_by(id: params[:id])
        render json: power, status: :ok
           
    end

     # PATCH /description
    def update
        power = Power.find_by(id: params[:id])
            if power
            power.update(power_params)
            render json: power
            else
            render json: { error: "Power not found" }, status: :not_found
            end
    end

    private 

    def power_params
        params.permit(:description)
    end
    def record_not_found
        render json: {error: "power not found"}, status: :not_found
    end

    

end
