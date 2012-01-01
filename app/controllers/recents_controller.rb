class RecentsController < ApplicationController
  # GET /recents
  # GET /recents.xml
  def index
    @recents = Recent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recents }
    end
  end

  # GET /recents/1
  # GET /recents/1.xml
  def show
    @recent = Recent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recent }
    end
  end

  # GET /recents/new
  # GET /recents/new.xml
  def new
    @recent = Recent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recent }
    end
  end

  # GET /recents/1/edit
  def edit
    @recent = Recent.find(params[:id])
  end

  # POST /recents
  # POST /recents.xml
  def create
    @recent = Recent.new(params[:recent])

    respond_to do |format|
      if @recent.save
        format.html { redirect_to(@recent, :notice => 'Recent was successfully created.') }
        format.xml  { render :xml => @recent, :status => :created, :location => @recent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recents/1
  # PUT /recents/1.xml
  def update
    @recent = Recent.find(params[:id])

    respond_to do |format|
      if @recent.update_attributes(params[:recent])
        format.html { redirect_to(@recent, :notice => 'Recent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recents/1
  # DELETE /recents/1.xml
  def destroy
    @recent = Recent.find(params[:id])
    @recent.destroy

    respond_to do |format|
      format.html { redirect_to(recents_url) }
      format.xml  { head :ok }
    end
  end
end
