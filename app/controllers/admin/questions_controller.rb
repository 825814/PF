class Admin::QuestionsController < ApplicationController
  def index
    @test = "テストテキスト"
  end

  def new
    @question = Question.new
  end
  
  def create
    @puestion = Question.new(question_params)
    if @question.save
      redirect_to ("/questions/new")
    else
      render ("/questions/new")
    end
  end
  
  private
    def question_params
      params.require(:question).permit(:title, :body)
    end

end
