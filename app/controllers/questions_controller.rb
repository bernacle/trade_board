class QuestionsController < ApplicationController

  before_action :find_offer
  before_action :find_question, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @question = @offer.questions.build(question_params)
    @question.user_id = current_user.id
    if @question.save
      QuestionNotifier.received(@offer, @question).deliver
      redirect_to @offer
    else
      flash[:error] = "Error ocurred on making a questions"
    end
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to @offer
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to @offer
  end

  private
    def find_offer
      @offer = Offer.find(params[:offer_id])
    end

    def question_params
      params.require(:question).permit(:subject, :content, :post_id, :user_id)
    end

    def find_question
      @question = @offer.questions.find(params[:id])
    end
end
