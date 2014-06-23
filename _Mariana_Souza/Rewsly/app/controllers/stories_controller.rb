class StoriesController < ApplicationController

	before_filter :load_resource, only: [:show, :edit]

	def index
		@stories = Story.search_for(params[:q]) || Story.all
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(story_params)

		if @story.save
			redirect_to stories_path
		else
			render "new"
		end
	end

	def show 
		@story = Story.find(params[:id])
	end


	def story_params
		allow = [:title, :link, :upvotes, :category]
		params.require(:story).permit(allow)
	end

	def load_resource
		@story = Story.find(params[:id])
	end

end

