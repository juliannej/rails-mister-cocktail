class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :update, :destroy]
  before_action :set_dose, only: [:destroy]

  def index
    @doses = Dose.all
  end

  # def show
  # end

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)

    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @dose.destroy
    redirect_to @cocktail
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
