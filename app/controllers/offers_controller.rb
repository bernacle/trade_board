class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to @offer
    else
      render 'edit'
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to @offer
    else
      render 'new'
    end
  end

  def destroy
    @offer.destroy
    redirect_to root_path
  end

  private
    def find_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:title, :description, :price, :photo)
    end

end
