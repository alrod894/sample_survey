# encoding: UTF-8
# Question#is_mandatory is now false by default. The default_mandatory option allows you to set
#   is_mandatory for all questions in a survey.
survey "new survey", :default_mandatory => false do

  section "New questions" do
    label "First section"

    question "what is your name?", :is_mandatory => true
    answer :string

    question "What kind of person are you?", :pick => :one
    answer "dog person"
    answer "cat person"
    answer :other

    q_2 "What food do you like?", :pick => :any
    a_1 "pizza"
    a_2 "tacos"
    a_3 "enchiladas"
    a :omit

    q_2a "Please explain why you like this food?"
    a_1 "explanation", :text, :help_text => "Please give an explanation for each food you like"
    dependency :rule => "A or B or C"
    condition_A :q_2, "==", :a_1
    condition_B :q_2, "==", :a_2
    condition_C :q_2, "==", :a_3

  end

  section "Second section" do

    grid "How many of theese you have" do
      a "1"
      a "2"
      a "3"
      q "Cars", :pick => :one
      q "TV's", :pick => :one
      q "Radio", :pick => :one
    end

    grid "Is this a very long survey?" do
      a "-2"
      a "-1"
      a "0"
      a "1"
      a "2"
      q "no|maybe" , :pick => :one
      q "may be yes|probably", :pick => :one
      q "yes|sure it is", :pick => :one
    end

    repeater "What are your hobbies?" do
      q "Hobby"
      a "Name", :string
      a "Why?", :string
    end

  end
end
