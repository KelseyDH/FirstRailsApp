class AnswersController < ApplicationController
##Generated separately after Answer Model was generated
before_action :find_question

def create
  @question = Question.find params[:question_id]
  @answer = @question.answers.new(answer_attributes)
  #answer_attributes is a private method taking care of NEW parameters

  if @answer.save
    redirect_to @question, notice: "Answer Submitted Successfully"
  else
    render "/questions/show"
  end
end


def destroy
  #find_question replaced need for:  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  if @answer.destroy
    redirect_to @question, notice: "Answer Deleted"
  else
    redirect_to @question, error: "We had trouble deleting the answer"
  end 
end

private

##private method to use for Answer.new
def answer_attributes
  params.require(:answer).permit([:body])
end

def find_question
  @question = Question.find params[:question_id]
end

end
