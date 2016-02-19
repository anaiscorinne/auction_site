class ReviewsController < ApplicationController
		before_action :authenticate_user!, except: :index

	def index
		@product = Product.find_by(id: params[:id])
		@reviews = @product.reviews.all
	end

	def create
		@user = current_user
		@product = Product.find_by(id: params[:product_id])
		@review = @product.reviews.create(review_params)
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
