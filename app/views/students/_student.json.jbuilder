json.extract! student, :id, :name, :course, :created_at, :updated_at
json.url student_url(student, format: :json)
