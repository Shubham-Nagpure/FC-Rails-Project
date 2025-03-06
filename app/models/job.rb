class Job < ApplicationRecord
  # CONSTANT
  STATUS = {
    open: 0,
    closed: 1
  }.freeze

  LOCATION = {
    Pune: "pune",
    Mumbai: "mumbai",
    Bangalore: "bangalore",
    Delhi: "delhi",
    Hyderabad: "hyderabad"
  }.freeze

  # ATTRIBUTES
  enum status: STATUS

  # VALIDATIONS
  validates_presence_of :title, :description, :location
  validates_length_of :title, maximum: 50
  validates_length_of :description, maximum: 1000

  # ASSOCIATIONS
  belongs_to :company
  has_many :job_applications

  # SCOPES
  scope :open, -> { where(status: :open) }
  scope :closed, -> { where(status: :closed) }
  scope :search_by_title, ->(title) { where("title LIKE ?", "%#{title}%") }
  scope :search_by_location, ->(location) { where("location LIKE ?", "%#{location}%") }
  scope :search_by_company, ->(company) { where("company_id LIKE ?", "%#{company}%") }
  scope :search_by_status, ->(status) { where("status LIKE ?", "%#{status}%") }

  # CALLBACKS
  after_initialize :set_status

  # METHODS
  def set_status
    self.status ||= :open
  end

  def format_title
    title.titleize
  end
end
