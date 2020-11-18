class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :jsoncat]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all
  end 


  def show
    @categories = Category.all
  end


  def create
    @category = Category.new(category_params)
    @categories = Category.all

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @categories = Category.all
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def jsoncat
    cat_bookmarks = Bookmark.where(category_id: @category.id)
    category_info =
    { 
        id: @category.id,
        visibility: @category.visibility,
        parent_id: @category.parent_id,
        subcategories: @category.subcategories,
        bookmarks: cat_bookmarks,
    }
    render json: category_info, status: :ok
end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def record_not_found(error)
    render :json => {:error => error.message}, :status => :not_found
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :visibility, :parent_id)
  end
end