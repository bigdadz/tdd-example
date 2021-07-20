require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Fields" do
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
  end

  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "Indexing" do
    it { should have_db_index(:first_name) }
  end

  describe "Methods" do
    describe "#full_name" do
      it "should return full name correctly" do
        user = User.new(first_name: "maina", last_name: "test")
        expect(user.full_name).to eq("maina test")
      end
    end
  end
end
