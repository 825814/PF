class Public::AnswersController < ApplicationController
  def new
    @answer = Answer.new

  end

  def create
    @answer = Answer.new(answer_params)
    @answer.questions_id = params[question_id]
    if @answer.save
      flash[:notice] = "成功！"
      redirect_to("/questions/#{params[question_id]}")
    else
      @question = Question.find(params[question_id])
      flash.now[:alert] = "失敗！"
      render "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:comment, :question_id, :customer_id)
  end

end

