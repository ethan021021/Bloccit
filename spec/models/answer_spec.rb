require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!(title: "New question", body: "New Question Body", resolved: false) }
  let(:answer) { Answer.create!(question: question, body: "A new answer body") }

  describe "attributes" do
    it "has question reference and body attribute" do
      expect(answer).to have_attributes(question: question, body: "A new answer body")
    end
  end
end
