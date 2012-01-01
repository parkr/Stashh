class RecentController < ApplicationController
  before_filter :require_user
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
