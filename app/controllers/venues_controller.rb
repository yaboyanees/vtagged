class VenuesController < ApplicationController
  respond_to :html, :json
 
  def vote
  	value = params[:type] == "up" ? 1 : -1
    @venue = Venue.find(params[:id])
    @venue.add_or_update_evaluation(:votes, value, current_user)
    redirect_to venues_url, notice: "Thank you for voting"
  end
  
  def index
  	@search = Venue.search(params[:search])
    @venues = @search.page(params[:page]).per(10)
#     @venues = @search.all(:order => "name ASC")
	@json = @venues.all.to_gmaps4rails do |venue, marker|
  marker.infowindow render_to_string(:partial => "info", :locals => { :venue => venue})
end
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to(venues_url, notice: 'Venue was successfully created.') }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])
    @venue.update_attributes(params[:venue])
    respond_with @venue
  end
#     @venue = Venue.find(params[:id])
# 
#     respond_to do |format|
#       if @venue.update_attributes(params[:venue])
#         format.html { redirect_to(venues_url, notice: 'Venue was successfully updated.') }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @venue.errors, status: :unprocessable_entity }
#       end
#     end
#   end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
end
