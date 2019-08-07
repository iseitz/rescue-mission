class AnswersController < ApplicationController
  before_action :find_question

  def index
    @question = find_question
    @answers = @question.answers
    # @answers = @question.answers
    # @user = User.find(@question.user_id)
  end

  def show
    @answer = Answer.find(params[:id])
    @user = User.find(@question.user_id)
  end

  def new
    @answer = Answer.new(:question_id => @question.id)
  end

  def create
    @question = find_question
    # @answer = @question.answers.build(answer_params)
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id

    if @answer.save
      flash[:notice] = "You have sucessfully created the answer."
      redirect_to @question
      # redirect_to(answers_path(@answer, :question_id => @question.id))
    else
      flash[:alert] = "Failed to save the answer."
      @errors = @answer.errors.full_messages
      render :action => '_new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer_params)
      flash[:notice] = "You have sucessfully updated the answer."
      redirect_to(answer_path(@answer, :question_id => @question.id))
    else
      render :edit
    end
  end

  def delete
    @answer = Asnwer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer was destroyed"
    redirect_to(answers_path)
  end

  private

   def answer_params
     params.require(:answer).permit(:body, :user_id, :question_id)
   end

   def find_question
     params.each do |name, value|
       # if name=~ /(.+)_id$/
       if name == 'question_id'
         # return $1.classify.constantize.find(value)
         return @question = Question.find(value.to_i)
       end
     end
     nil
   end

end
