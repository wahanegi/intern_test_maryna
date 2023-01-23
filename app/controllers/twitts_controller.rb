class TwittsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]
  protect_from_forgery with: :null_session

  def destroy
    @twitt = Twitt.find_by id: params[:id]
    @twitt.destroy
    redirect_to twitts_path
  end
  def index
    @twitts = Twitt.all.order(created_at: :desc)
  end

  def new
    @twitt = Twitt.new
  end

  def create
     @twitt = Twitt.new twitt_params

    if @twitt.save
      redirect_to twitts_path
    else
      render :new
    end
  end

  def edit
    @twitt = Twitt.find_by id: params[:id]
  end

  def update
    @twitt = Twitt.find_by id: params[:id]
    if @twitt.update twitt_params
      redirect_to twitts_path
    else
      render :edit
    end
  end

  private
  def twitt_params
    params.require(:twitt).permit(:body)
  end

end


