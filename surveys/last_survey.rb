# encoding: UTF-8
survey "Last survey", :default_mandatory => false do

  section "Last first section" do
    label "These questions are examples of the basic supported input types"

    question "Name please.", :is_mandatory => true
    answer :string

    q_2 "What kind of console do you have?", :pick => :any
    a_1 "ps3"
    a_2 "switch"
    a_3 "xbox"
    a :omit

    q_2b "Why do you have so many consoles?"
    a_1 "explanation", :text
    dependency :rule => "Z"
    condition_Z :q_2, "count>1"

    q_montypython3 "What... is your gamer tag?"
    a_1 :string

    q_cooling_1 "what else fo you like to do?", :pick => :one
    a_1 "play any sport"
    a_2 "Gambling"
    a_3 "Chill"

    q "How many games do you have?"
    a :integer
    validation :rule => "A"
    condition_A ">=", :integer_value => 0

    q "Choose your character", :pick => :one, :display_type => :dropdown
    ["Mario", "Luigi", "Banjo"].each{ |char| a char}

  end
end
