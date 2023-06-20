class SpicesController < ApplicationController
    wrap_parameters format: []

    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spices = Spice.find_by(id: params[:id])
        render json: spices
    end

    def create
        new_spice = Spice.create(spice_params)
        if new_spice && new_spice.present?
            render json: new_spice
        else
            render json: {error: "Spice already created"}
        end
    end

    def update
        update_spice = Spice.find_by(id: params[:id])
        if update_spice
            update_spice.update(spice_params)
            render json: update_spice
        else
            render json: {error: "Not found"}
        end
    end

    def destroy
        destroy_spice = Spice.find_by(id: params[:id])
        if destroy_spice
            destroy_spice.destroy
            head :no_content
        else 
            render json: {error: :not_found}
        end
        
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
