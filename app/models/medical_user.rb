class MedicalUser < ApplicationRecord
  validates :idpass, presence: true, length: { maximum: 50 }
  has_secure_password
end
