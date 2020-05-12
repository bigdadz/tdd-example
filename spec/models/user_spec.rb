require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Fields" do
    it { is_expected.to have_field(:name).of_type(String) }
  end

  describe "Association" do
  end

  describe "Validations" do
  end

  describe "Index" do
  end

  describe "Methods" do
  end
end
