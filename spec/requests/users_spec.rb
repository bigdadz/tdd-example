require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "should return index page successfully" do
      get '/users'
      expect(response.status).to eq(200)
    end
  end

  describe "POST /create" do
    it "should create new user succesfully" do
      post "/users", params: {
        users: {
          first_name: "test1",
          last_name: "test2"
        }
      }
      user = User.first
      expect(user.first_name).to eq("test1")
      expect(user.last_name).to eq("test2")
      expect(response).to redirect_to(user_path(user))
    end

    it "shouldn't create new user" do
      post "/users", params: {
        users: {
          first_name: "",
          last_name: "test2"
        }
      }
      
      expect(response).to render_template(:new)
    end
  end

  describe "POST /new" do
    it "should return index page successfully" do
      get '/users/new'
      expect(response.status).to eq(200)
    end
  end

  describe "GET /edit" do
    let(:user) { FactoryBot.create(:user) }

    it "should return edit page successfully" do
      get "/users/#{user.id}/edit"

      expect(response.status).to eq(200)
    end
  end

  describe "PUT /update" do
    let(:user) { FactoryBot.create(:user, first_name: "northv2", last_name: "mainaja") }

    it "should update value in user model correctly" do
      put "/users/#{user.id}", params: {
        users: {
          first_name: "northv3",
          last_name: "maina"
        }
      }

      user.reload
      expect(user.first_name).to eq("northv3")
      expect(user.last_name).to eq("maina")
      expect(response).to redirect_to(user_path(user))
    end

    it "shouldn't update value in user model" do
      put "/users/#{user.id}", params: {
        users: {
          first_name: "",
          last_name: "maina"
        }
      }
      
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE /destroy" do
    let(:user) { FactoryBot.create(:user) }

    it "should delete user successfully" do
      delete "/users/#{user.id}"

      expect(User.count).to eq(0)
    end
  end

  describe "GET /show" do
    let(:user) { FactoryBot.create(:user) }

    it "should return edit page successfully" do
      get "/users/#{user.id}"

      expect(response.status).to eq(200)
    end
  end
end
