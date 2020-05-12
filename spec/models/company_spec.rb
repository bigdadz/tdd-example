require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:user)                { FactoryBot.create(:user) }
  
  describe "Fields" do
    it { is_expected.to have_field(:name).of_type(String) }
    it "test" do
      pp user.name
    end
  end

  describe "Association" do
    it { is_expected.to have_many(:users) }
  end

  describe "Validations" do
  end

  describe "Index" do
  end

  describe "Methods" do
  end
end
