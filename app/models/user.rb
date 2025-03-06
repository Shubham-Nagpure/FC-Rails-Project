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
  before_save :format_name
  before_validation :gender_downcase
  after_create :send_mail

  # ASSOCIATIONS
  has_many :job_applications
  has_many :jobs, through: :job_applications

  # METHODS
  def gender_downcase
    self.gender = gender.downcase if gender.present?
  end

  def send_mail
    puts "**************** Sending Registration Mail to User *********************"
  end

  def format_name
    name.titleize
  end
end
