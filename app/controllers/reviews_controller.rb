class ReviewsController < ApplicationController

  #def new
   # @cocktail = Cocktail.find(params[:cocktail_id])
    #@review = Review.new

  #end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    # we need `cocktail_id` to associate review with corresponding cocktail
    @review.cocktail = @cocktail
    if  @review.save

    redirect_to cocktail_path(@cocktail)
  else
    @dose = Dose.new # not really understand why we write this.
    render  "cocktails/show"
  end


  end

  private

  def review_params
    params.require(:review).permit(:content)

  end
end
