class WelcomeController < ApplicationController
  def index
    if @current_user.nil?
      respond_to do |format|
        format.html # index.html.erb
      end
    else
      redirect_to "/recent"
    end
  end
  
  def about
		respond_to { |format| format.html }
  end
	
	def privacy
		respond_to { |format| format.html }
	end
end
