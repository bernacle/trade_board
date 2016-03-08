class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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
    @offer = current_user.offers.build
  end

  def create
    @offer = current_user.offers.build(offer_params)
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
      params.require(:offer).permit(:title, :description, :price, :photo, :user_id)
    end

end
