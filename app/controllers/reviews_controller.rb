class ReviewsController < ApplicationController
		before_action :authenticate_user!, except: :index

	def index
	end

	def create
	end

	def new
	end

end
