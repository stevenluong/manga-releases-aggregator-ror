class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :out, :except=>[:index,:create,:destroy]
  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = current_user.subscriptions.select{|s| s.manga !=nil && s.manga.display_name != nil && s.manga.name!=nil}.sort_by{|s| s.manga.display_name}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = current_user.subscriptions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = current_user.subscriptions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = current_user.subscriptions.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = current_user.subscriptions.new
    manga = Manga.find(params[:manga_id])
		@subscription.manga_id=manga.id

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to mangas_path, notice: 'Successfully subscribed to '+ manga.display_name.to_s}
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        format.html { render action: "new" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.json
  def update
    @subscription = current_user.subscriptions.find(params[:id])

    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
		manga = Manga.find(@subscription.manga_id)
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to mangas_url, notice: 'Successfully unsubscribed to '+ manga.display_name.to_s}
      format.json { head :no_content }
    end
  end
end
