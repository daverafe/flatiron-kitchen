class IngredientsController < ApplicationController
    before_action :get_ingredient, except: [:new, :create]

    def new
        @ingredient = Ingredient.new 
    end

    def create
        ingredient = Ingredient.new(ingredient_params)
        if ingredient.save
            redirect_to ingredient_path(ingredient)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @ingredient.update(ingredient_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit 
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def get_ingredient
        @ingredient = Ingredient.find_by_id(params[:id])
    end
end
