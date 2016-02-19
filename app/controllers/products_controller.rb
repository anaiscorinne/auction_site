class ProductsController < ApplicationController

		before_action :authenticate_user!, except: :all_index

	def all_index
		@products = Product.all
	end

	def product_show
		@product = Product.find_by(id: params[:id])
	end

	def index
		@user = User.find_by(id: params[:user_id])
		@products = @user.products.all
	end

	def show
		@user = User.find_by(id: params[:user_id])
		@products = @user.products.find_by(id: params[:id])
		if @product
			render 'product_show'
		else
			redirect_to '/'
		end
	end

	def create
		@user = User.find_by(id: params[:user_id])
		@product = @user.products.new(product_params)
		if @product.save
			redirect_to user_products_path(@user)
		else
			render 'new'
		end
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@product = @user.products.new
	end

	def destroy
	end

	private
	def product_params
		params.require(:product).permit(:title, :deadline, :description)
	end

end
