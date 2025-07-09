class Customer < ApplicationRecord
  has_one_attached :image

  # Validations
  validates :full_name, presence: true

  validates :email_address,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" },
            uniqueness: { allow_blank: true, message: "has already been taken" },
            allow_blank: true

  validates :phone_number,
            length: { minimum: 10, message: "must be at least 10 digits" },
            allow_blank: true

  validates :notes, length: { maximum: 500, message: "must be less than 500 characters" }

  # Allow ActiveAdmin/Ransack filters
  def self.ransackable_associations(auth_object = nil)
    %w[image_attachment image_blob]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[full_name phone_number email_address notes]
  end
end
