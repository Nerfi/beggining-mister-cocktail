class ReviewsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    # we need `cocktail_id` to associate review with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save

    redirect_to cocktail_path(@cocktail)


  end

  private

  def review_params
    params.require(:review).permit(:content)

  end
end
