class AnswersController < ApplicationController

  before_action :find_question
  before_action :find_answer, only: [:show, :edit, :update, :destroy]


  def create
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to offer_path(@question.offer)
    else
      flash[:error] = "Error ocurred on answering the question"
    end
  end

  def new
    @answer = @question.answers.build
  end

  def show

  end

  def edit

  end

  def update
    if @answer.update(answer_params) && current_user == @question.offer.user
      redirect_to offer_path(@question.offer)
    else
      render 'edit'
    end
  end

  def destroy
    if current_user == @question.offer.user
      @answer.destroy
      redirect_to offer_path(@question.offer)
    else
      flash[:info] = "You can't delete this answer"
    end
  end

  private
  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = @question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end
end
