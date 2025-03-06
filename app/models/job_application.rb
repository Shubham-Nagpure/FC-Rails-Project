class JobApplication < ApplicationRecord
  # CONSTANTS
  STATUS = {
    applied: 0,
    accepted: 1,
    rejected: 2
  }.freeze

  # ATTRIBUTES
  enum status: STATUS

  # VALIDATIONS
  validates :status, presence: true
  validates_presence_of :applied_on, :job_id, :user_id, presence: true
  validates :status, inclusion: { in: STATUS.keys.to_s, message: "%{value} is not a valid status" }
  validates_uniqueness_of :job_id, scope: :user_id, message: "You have already applied for this job"
  validates_associated :job, :user, message: "Invalid job or user"

  # ASSOCIATIONS
  belongs_to :job
  belongs_to :user

  # SCOPES
  default_scope { order(applied_on: :desc) }
  scope :applied, -> { where(status: :applied) }
  scope :accepted, -> { where(status: :accepted) }
  scope :rejected, -> { where(status: :rejected) }


  # METHODS
  def accepted?
    status == :accepted
  end

  def rejected?
    status == :rejected
  end

  def applied?
    status == :applied
  end

  def accepted!
    self.status = :accepted
    save
  end

  def rejected!
    self.status = :rejected
    save
  end
end
