json.extract! job_application, :id, :status, :applied_on, :job_id, :user_id, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
