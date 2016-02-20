class ReviewsController < ApplicationController
		before_action :authenticate_user!, except: :index

	def index
		@user = current_user
		@product = Product.find_by(id: params[:id])
		@reviews = @product.reviews.all
	end

	def create
		@user = current_user
		@product = Product.find_by(id: params[:product_id])
		@review = @product.reviews.new(review_params)
		@review.user = @user
		@review.save
		render json: @product.to_json(:include => :reviews)
	end

	def new
		@user = current_user
		@product = Product.find_by(id: params[:id])
		@review = @product.reviews.new
	end

	private
	def review_params
		params.require(:review).permit(:title, :description)
	end

end
