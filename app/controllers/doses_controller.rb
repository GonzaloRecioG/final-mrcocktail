class DosesController < ApplicationController
  before_action :find_cocktail, only: [:show, :new, :create, :destroy]

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    #what build does
    # @dose = Dose.new
    # @dose.cocktail = @cocktail
    # @dose.save
    if @dose.save
      flash[:notice] = "Your Cocktail was created."
      redirect_to cocktail_path(@cocktail.id)
    else
      flash[:notice] = "Oops something went wrong"
      render "new"
    end

  end

  def destroy
    @dose = @cocktail.doses.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
