class CreateCourseSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :course_subjects do |t|
      t.references :subject, null: false
      t.references :course, null: false

      t.timestamps
    end
  end
end
