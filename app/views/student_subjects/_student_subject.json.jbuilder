json.extract! student_subject, :id, :subject, :course, :rate, :created_at, :updated_at
json.url student_subject_url(student_subject, format: :json)
