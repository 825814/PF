class Admin::QuestionsController < ApplicationController
  def index
    @test = "テストテキスト"
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    # @text = "new_テストテキスト"
  end

  def create
    @question = Question.new(question_params)
    # @text = "create_テストテキスト"
    if @question.save
      flash[:notice] = "成功！"
      redirect_to ("/admin/questions/#{@question.id}")
    else
      flash.now[:alert] = "失敗！"
      render ("/admin/questions/new")
    end
  end



  private
    def question_params
      params.require(:question).permit(:title, :body)
    end

end
