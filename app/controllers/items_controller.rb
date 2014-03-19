class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  def search
    #binding.pry

    puts '#####################################################'+params[:q].to_s
    puts '#####################################################'+params[:w].to_s
    puts '#####################################################'+params[:s].to_s
    puts '#####################################################'+params[:category].to_s
    puts '#####################################################'+params.to_s

    #@search= Item.find_by_title params[:q]

    #@search = Item.where({:title => params[:q], :description => params[:w]}).all

    if params[:s]=="1"
      @search = Item.where({:title => params[:q], :description => params[:w], :category  => params[:category]}).all
=begin    
      puts '#####################################################'+"should be 1"
      puts '#####################################################'+params[:s].to_s
      puts '#####################################################'+"prams s == 1"
      puts '#####################################################'+params[:s] == 1
      puts '#####################################################'+"should be false"
      puts '#####################################################'+params[:s].class.to_s
      puts '#####################################################'+@search.to_s
=end
    else
      @search = Item.where({:title => params[:q]}).all
      @search += Item.where({:description => params[:w]}).all
      @search += Item.where({:category  => params[:category]}).all
=begin
      puts '#####################################################'+"should be 2"
      puts '#####################################################'+params[:s].to_s
      puts '#####################################################'+"prams s == 2"
      puts '#####################################################'+params[:s] == 2
      puts '#####################################################'+"should be false"
      puts '#####################################################'+params[:s].class.to_s
      puts '#####################################################'+@search.
=end  
    end

    
    if(!@search.empty?)
      @items = @search
      render :index
    else
      
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :type)
    end
end
