class RecipesController < ApplicationController
    before_action :get_recipe, except: [:new, :create]
    
    def new
        @recipe = Recipe.new 
    end

    def create
        recipe = Recipe.new(recipe_params)
        if recipe.save 
            redirect_to recipe_path(recipe)
        else
            render :new 
        end
    end

    def show
    end

    def edit
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def get_recipe
        @recipe = Recipe.find_by_id(params[:id]) 
    end
end
