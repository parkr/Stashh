class FontsController < ApplicationController
  # GET /fonts
  # GET /fonts.xml
  before_filter :require_user
  def index
    @fonts = Font.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fonts }
    end
  end

  # GET /fonts/1
  # GET /fonts/1.xml
  def show
    @font = Font.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @font }
    end
  end

  # GET /fonts/new
  # GET /fonts/new.xml
  def new
    @font = Font.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @font }
    end
  end

  # GET /fonts/1/edit
  def edit
    @font = Font.find(params[:id])
  end

  # POST /fonts
  # POST /fonts.xml
  def create
    @font = Font.new(params[:font])

    respond_to do |format|
      if @font.save
        format.html { redirect_to(@font, :notice => 'Font was successfully created.') }
        format.xml  { render :xml => @font, :status => :created, :location => @font }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @font.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fonts/1
  # PUT /fonts/1.xml
  def update
    @font = Font.find(params[:id])

    respond_to do |format|
      if @font.update_attributes(params[:font])
        format.html { redirect_to(@font, :notice => 'Font was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @font.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fonts/1
  # DELETE /fonts/1.xml
  def destroy
    @font = Font.find(params[:id])
    @font.destroy

    respond_to do |format|
      format.html { redirect_to(fonts_url) }
      format.xml  { head :ok }
    end
  end
end
