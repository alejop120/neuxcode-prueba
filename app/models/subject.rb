class Subject < ApplicationRecord
	has_many :course_subjects, dependent: :destroy
	has_many :courses, through: :course_subjects
	has_many :student_subjects, dependent: :destroy
	has_many :students, through: :student_subjects
	
	validates :name, presence: { message: "obligatorio" }
	validates :course_id, presence: { message: "obligatorio" }
end
