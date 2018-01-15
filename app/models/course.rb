class Course < ApplicationRecord
	has_many :students, dependent: :destroy
	has_many :course_subjects, dependent: :destroy
	has_many :subjects, through: :course_subjects
	validates :name, presence: { message: "obligatorio" }
end
