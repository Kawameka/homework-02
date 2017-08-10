class CatalogsController < ApplicationController

  def index
    @books = Book.includes(:authors).search(params[:term])
  end
  
end
