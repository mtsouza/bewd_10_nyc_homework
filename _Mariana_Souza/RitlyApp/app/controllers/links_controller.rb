class LinksController < ApplicationController

	def index
		@links = Link.all
	end

	def new
		@link = Link.new
		@link.hashcode = SecureRandom.hex(3)
	end

	def show
		link = Link.where(:hashcode => params[:id]).first

		if link
			redirect_to link.link
		else
			render "new"
		end
	end

	def create
		@link = Link.new(link_params)

		if @link.save
			redirect_to links_path
		else
			render "new"
		end
	end

	def link_params
		params.require(:link).permit(:link, :hashcode)
	end

	def edit
		@link = Link.find(params[:id])
	end

	def update
		@link = Link.find(params[:id])

		if @link.update_attributes(link_params)
			redirect_to links_path, :notice => "Your link has been updated"
		else
			render "edit"
		end
	end

end
