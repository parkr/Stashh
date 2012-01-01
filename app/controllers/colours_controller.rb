class ColoursController < ApplicationController
  # GET /colours
  # GET /colours.xml
  before_filter :require_user
  def index
    @colours = Colour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @colours }
    end
  end

  # GET /colours/1
  # GET /colours/1.xml
  def show
    @colour = Colour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @colour }
    end
  end

  # GET /colours/new
  # GET /colours/new.xml
  def new
    @colour = Colour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @colour }
    end
  end

  # GET /colours/1/edit
  def edit
    @colour = Colour.find(params[:id])
  end

  # POST /colours
  # POST /colours.xml
  def create
    # Calculate empty params
    colour = params[:colour]
    if !colour[:hex].nil? and colour[:hex] != ""
      # make sure '#' is the first character
      colour[:hex] = "##{colour[:hex]}" if colour[:hex][0] != "#"
      # convert to rgba
      colour[:red] = colour[:hex][1..2].hex
      colour[:green] = colour[:hex][3..4].hex
      colour[:blue] = colour[:hex][5..6].hex
      colour[:alpha] = 1
    else
      if !colour[:red].nil? and colour[:red] != ""
        # convert and concatenate
        rhex = to_hex(colour[:red])
        ghex = to_hex(colour[:green])
        bhex = to_hex(colour[:blue])
        colour[:hex] = "##{rhex}#{ghex}#{bhex}"
      end
    end
    
    @colour = Colour.new(colour)
    
    respond_to do |format|
      if @colour.save
        format.html { redirect_to(@colour, :notice => "Colour was successfully created: #{colour}") }
        format.xml  { render :xml => @colour, :status => :created, :location => @colour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @colour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /colours/1
  # PUT /colours/1.xml
  def update
    @colour = Colour.find(params[:id])

    colour = params[:colour]
    #what's different? update what hasn't changed
    if @colour[:hex].eql?(colour[:hex]) # hex hasn't changed, so RGB did! Update it.
      # make sure '#' is the first character
      colour[:hex] = "##{colour[:hex]}" if !colour[:hex][0].eql?("#")
      # convert to rgba
      colour[:red] = colour[:hex][1..2].hex
      colour[:green] = colour[:hex][3..4].hex
      colour[:blue] = colour[:hex][5..6].hex
      colour[:alpha] = 1
    else # hex changed. update it
      rhex = to_hex(colour[:red])
      ghex = to_hex(colour[:green])
      bhex = to_hex(colour[:blue])
      colour[:hex] = "##{rhex}#{ghex}#{bhex}"
    end
    
    params[:colour] = colour
    
    respond_to do |format|
      if @colour.update_attributes(params[:colour])
        format.html { redirect_to(@colour, :notice => "Colour was successfully updated. #{params}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @colour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /colours/1
  # DELETE /colours/1.xml
  def destroy
    @colour = Colour.find(params[:id])
    @colour.destroy

    respond_to do |format|
      format.html { redirect_to(colours_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def max(a, b)
    a > b ? a : b
  end

  def min(a, b)
    a < b ? a : b
  end
  def to_hex(n)
    n = n.to_i.to_s(10).to_i
    if n.zero? 
      return "00"
    end
    n = max(0, min(n,255));
    chars = "0123456789abcdef"
    return "#{chars[((n-n%16)/16)]}#{chars[(n%16)]}";
  end
end
