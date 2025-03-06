module JobApplicationsHelper
  def status_options
    JobApplication::STATUS.keys.map { |key, val| [ key.capitalize, key ] }
  end
end
