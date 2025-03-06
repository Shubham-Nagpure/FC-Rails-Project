class User < ApplicationRecord
  # CONSTANT
  GENDER = {
    male: 1,
    female: 2
  }.freeze

  # ATTRIBUTE
  enum gender: GENDER

  # VALIDATIONS
  validates :name, :email, :password, :mobile, presence: true
  validates_uniqueness_of :email, message: "Email already exists"
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :gender, inclusion: { in: ["male", "female"], message: "%{value} is not a valid gender" }
  validates :mobile, numericality: { only_integer: true }, length: { is: 10 }

  # SCOPES
  scope :male, -> { where(gender: :Male) }
  scope :female, -> { where(gender: :Female) }

  # CALLBACKS
  before_save :format_email
  before_save :format_name
  # before_validation :convert_gender_to_integer
  # before_create :convert_gender_to_integer

  # ASSOCIATIONS
  has_many :job, through: :job_applications
  has_many :job_applications

  # METHODS
  # def convert_gender_to_integer
  #   debugger
  #   self.gender = gender.to_i if gender.present?
  # end

  def format_email
    email.downcase!
  end

  def format_name
    name.titleize
  end
end
