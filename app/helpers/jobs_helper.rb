module JobsHelper
  def format_title(title)
    title.titleize
  end

  def company_options
    Company.all.map { |company| [ company.name, company.id ] }
  end

  def location_option
    Job::LOCATION.map { |key, val| [ key, val ] }
  end

  def format_location(location)
    location.titleize
  end
end
