class CreateStudentSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :student_subjects do |t|
      t.references :subject
      t.references :student
      t.decimal :rate, precision: 2, scale: 1

      t.timestamps
    end
  end
end
