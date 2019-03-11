class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, except: [:index, :new, :create]

  def index
    @questions = Question.all.order("id DESC")
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @question.answers.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "You have successfully posted your question"
      redirect_to  @question

    else
      @errors = @question.errors.full_messages
      render action: :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
     @question = Question.find(params[:id])
     @question.update(question_params)
     @answer = @question.answers.new(question_params)
     @question.answers.first.user_id = current_user.id
   # binding.pry
   if @question.save
     flash[:notice] = "You have sucessfully posted your answer"
     redirect_to @question
   else
      redirect_to edit_question_answer_path(@answer), flash: { danger: @question.errors.full_messages.join(",")}
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:headline, :body, :user_id, :answer, answers_attributes:[:body, :user_id, :question_id])
  end

end
