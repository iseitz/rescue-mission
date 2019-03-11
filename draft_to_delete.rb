# def update #from questions
#   @question = Question.find(params[:id])
#    @question.update(question_params)
#    @answer = params["question"]["answer"]
#    if @question.save
#
#     redirect_to new_question_answer_path,
#
#     flash[:notice] = "You have sucessfully posted your answer"
#   else
#     redirect_to edit_answer_path(@answer), flash: { danger: @answer.errors.full_messages.join(",")}
#   end
# end
#
#
#  from view new form answers<%= form_for @question do |form| %>
#   <%=form.fields_for :answer do |answer_form| %>
#
#    <div class='your-answer container'>
#
#       <%=answer_form.label :body %><br>
#       <%=answer_form.text_field :body %>
#
#
#       <%=answer_form.hidden_field :user_id, value: current_user.id, class:'d-none' %>
#       <%=answer_form.hidden_field :question_id, value: @question.id %>
#    </div>
#
#       <% end %>
#
#    <div>
#
#       <%=form.submit 'Post Your Answer', class: 'btn-primary' %>
#
#   </div>
#   <% end %>
#
#
#
#
#
# from answers controller
# create
# @answer = @question.answers.create(answer_params)
# @answer.user = current_user
#
#
# from views for answers
#
# <div class="question">
#   <div class="col-md-8 question-details">
#     <div class="question-wrapper">
#       <h2 class="question-title"><%=@question.headline %></h2>
#         <div class="username"><%= @user.username %></div>
#         <div class="question-body"><%= @question.body %></div>
#     </div>
#   </div>
#   <% if @answers.length > 0 %>
#
#     <%= link_to "Your Answer", new_question_answer_path, class:"post-answer" %>
#
#     <div class="col-md-8 answers-details">
#       <div class="answers-wrapper">
#         <h2><%= @answers.length %> Answers </h2>
#
#         <% @answers.each do |answer| %>
#         <% @question_user = answer.user %>
#         <div class="username"><%= @question_user.username %></div>
#         <div class="answer-body"><%= answer.body %></div>
#         <% end %>
#       </div>
#     </div>
#
#   <% else %>
#     <h2> Your Answer </h2>
#
#       <% if @errors %>
#         <ul>
#           <% @errors.each do |error| %>
#           <li><%= error %></li>
#           <% end %>
#         </ul>
#       <% end %>
#
#
#       <%= render @question.answers, question: @question %>
#       <%= render '/answers/new'%>
#       <%= render '/answers/answers' %>
#
#   <% end %>
#
# </div>
#
#
#
# form for answers latest version march 11th
# <%= form_for @question do |form| %>
#    <%=form.fields_for :answer do |answer_form| %>
#      <div class="form-group">
#         <%=answer_form.text_area :body, placeholder: "Add your answer", rows:10, class:"form-control" %><br>
#
#          <%=answer_form.hidden_field :user_id, value: current_user.id, class:'d-none' %>
#          <%=answer_form.hidden_field :question_id, value: @question.id %>
#       </div>
#     <% end %>
#
#     <div>
#        <%=form.submit 'Post Your Answer', class: 'btn-primary' %>
#    </div>
#  <% end %>
#
#
#  <div id="answers">
#    <% for answer in Answers %>
#    <div class="answer">
#      <%=simple_format answer.body %>
#    </div>
#    <%end%>
#  </div>
#  <%form_for [@question, Answer.new] do |f| %>
#  <p>
#    <%= f.label :body %><br />
#    <%= f.text_area :content %>
#  </p>
#
#     <p><%=f.submit 'Post Your Answer'%></p>
# <% end %>
# #

#   from VIEWS _answers  march 11th
#   <table>
# <tbody>
#   <ol>
#     <% @question.answers.order(:created_at).each do |answer|%>
#     <li><%= answer.body %></li>
#     <% end %>
#   </ol>
# </tbody>
# </table><br>
# </div>
