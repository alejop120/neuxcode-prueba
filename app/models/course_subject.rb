class CourseSubject < ApplicationRecord
	belongs_to :subject
	belongs_to :course
	validates :subject_id, presence: { message: "obligatorio" }
	validates :course_id, presence: { message: "obligatorio" }
end
