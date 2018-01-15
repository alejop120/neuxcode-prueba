module Api::V1
    class StudentsController < ApplicationController

		def get_students
			result = { success: true, status: 200, message: "Estudiantes" }

			students = Student.all
			result[:students] = students

			render json: result.to_json(include: :subjects)
		end

	end
end