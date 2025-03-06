module CompaniesHelper
  def industry_options
    Company::INDUSTRY.keys.map { |key, val| [ key.capitalize, key ] }
  end

  def user_options
    User.all.map { |user| [ user.name, user.id ] }
  end

  def job_options
    Job.all.map { |job| [ "#{job.title}-#{job.company.name}", job.id ] }
  end
end
