class Student < ApplicationRecord
	belongs_to :course
	has_many :student_subjects, dependent: :destroy
	has_many :subjects, through: :student_subjects
	
	validates :name, presence: { message: "obligatorio" }
end
