class StudentSubject < ApplicationRecord
	belongs_to :subject
	belongs_to :student
	
	validates :subject_id, presence: { message: "obligatorio" }
	validates :student_id, presence: { message: "obligatorio" }
	validates :rate, presence: { message: "obligatorio" }
end
