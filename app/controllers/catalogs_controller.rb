class CatalogsController < ApplicationController

  def index
    @books = Book.includes(:authors).search(params[:term]).paginate(:page => params[:page], :per_page => 25)
  end
  
end
