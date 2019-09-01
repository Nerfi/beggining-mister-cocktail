class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new

  end

  def create
  @dose = Dose.new(dose_params)
  # we need `cocktail_id` to associate dose with corresponding cocktail
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose.cocktail = @cocktail
  if @dose.save

  redirect_to cocktails_path(@cocktail)
  else
    render :new
end

  end

  private

  def dose_params
    params.require(:dose).permit(:description)

  end

end
