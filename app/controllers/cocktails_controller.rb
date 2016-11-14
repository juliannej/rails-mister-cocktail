class CocktailsController < ApplicationController
  # before_action :user_signed_in?, only: [:new, :create]
  def index
    @cocktails = Cocktail.order('name ASC')
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  # def dose_params
  #   params.require(:cocktail).require(:doses_attributes).require("0").permit(:description,:ingredient_id)
  # end
end
