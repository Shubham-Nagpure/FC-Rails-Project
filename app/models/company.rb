class Company < ApplicationRecord
  # CONSTANT
  INDUSTRY = {
    Accounting: 1,
    Banking: 2,
    Biotechnology: 3,
    Communications: 4,
    Construction: 5,
    Engineering: 6,
    Entertainment: 7,
    Finance: 8,
    Retail: 9,
    Technology: 10,
    Telecommunications: 11,
    Other: 12
  }.freeze

  # ATTRIBUTES
  enum industry: INDUSTRY

  # VALIDATIONS
  validates_presence_of :name, :industry
  validates_length_of :name, maximum: 100, message: "is too long"
  validates :industry, inclusion: { in: INDUSTRY.keys.to_s, message: "is not a valid industry" }

  # ASSOCIATIONS
  has_many :jobs

  # METHODS
  def format_name
    name.titleize
  end

  def format_industry
    industry.titleize
  end
end
