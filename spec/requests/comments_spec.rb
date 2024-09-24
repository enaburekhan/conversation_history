# spec/requests/comments_spec.rb

require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /projects/:project_id/comments" do
    let(:user) { create(:user) }
    let(:project) { create(:project) }
    let(:valid_attributes) { { comment: { body: "This is a test comment" } } }
    let(:invalid_attributes) { { comment: { body: "" } } }

    before do
      sign_in user
    end

    context "with valid parameters" do
      it "creates a new comment and redirects with http status success" do
        expect {
          post project_comments_path(project), params: valid_attributes
        }.to change(Comment, :count).by(1)

        expect(response).to have_http_status(:redirect)
        follow_redirect!  # Follow the redirect after the comment is created

        expect(response).to have_http_status(:success)
        expect(response.body).to include('Comment was successfully created.')
      end
    end

    context "with invalid parameters" do
      it "does not create a new comment and redirects with an error message" do
        expect {
          post project_comments_path(project), params: invalid_attributes
        }.to_not change(Comment, :count)

        expect(response).to have_http_status(:redirect)
        follow_redirect!

        expect(response).to have_http_status(:success) # Still a success page with an alert message
        expect(response.body).to include('Comment could not be created')
      end
    end
  end
end

