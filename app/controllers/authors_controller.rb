class AuthorsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash.notice = 'Author successfully saved!'
      redirect_to root_path
    else
      flash.alert = 'Author was not saved, please try again.'
      render :new
    end
  end
  
  def show
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to root_path
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)
    redirect_to root_path
  end

  private
    
  def author_params
    params.require(:Author).permit(:first_name, :last_name, :age)
  end

end
