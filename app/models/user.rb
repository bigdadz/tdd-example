class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    # self.first_name + " " + self.last_name
    # "#{self.first_name} #{self.last_name}"
    "#{first_name} #{last_name}"
  end
end
