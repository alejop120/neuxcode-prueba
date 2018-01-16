class CourseSubjectsController < ApplicationController
  before_action :set_course_subject, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:new, :create]

  # GET /course_subjects
  # GET /course_subjects.json
  def index
    @course = Course.find(params[:course_id])
    @course_subjects = @course.subjects
  end

  # GET /course_subjects/1
  # GET /course_subjects/1.json
  def show
  end

  # GET /course_subjects/new
  def new
    @course_subject = CourseSubject.new
    @assigned_subjects = @course.subjects
    @subjects_to_assign = Subject.where.not(id: @assigned_subjects)
  end

  # GET /course_subjects/1/edit
  def edit
  end

  # POST /course_subjects
  # POST /course_subjects.json
  def create
    destroy_subjects = params[:destroy_subjects]
    if destroy_subjects.present?
      destroy_subjects.each do |subject_id|
        destroy_course = CourseSubject.find_by(course_id: @course.id, subject_id: subject_id)
        if destroy_course.destroy
          puts "Deleted course subject"
        else
          puts "Error removing course subject: #{destroy_course.errors.full_messages}"
        end
        @course.students.each do |student|
          destroy_student_subject = StudentSubject.find_by(student_id: student.id, subject_id: subject_id)
          if destroy_student_subject.destroy
            puts "Deleted Student Subject"
          else
            puts "Error removing student subject: #{destroy_student_subject.errors.full_messages}"
          end
        end
      end
    end
    new_subjects = params[:new_subjects]
    if new_subjects.present?
      new_subjects.each do |subject_id|
        new_course_subject = CourseSubject.new(course_id: @course.id, subject_id: subject_id)
        if new_course_subject.save
          puts "Created Course Subject"
        else
          puts "Error creating course subject: #{new_course_subject.errors.full_messages}"
        end
        @course.students.each do |student|
          new_student_subject = StudentSubject.new(student_id: student.id, subject_id: subject_id)
          if new_student_subject.save
            puts "Created Course Subject"
          else
            puts "Error creating course subject: #{new_student_subject.errors.full_messages}"
          end
        end
      end
    end
    respond_to do |format|
      format.js {  flash[:notice] = "Cursos asignados a #{@course.name} correctamente" }
    end

  end

  # PATCH/PUT /course_subjects/1
  # PATCH/PUT /course_subjects/1.json
  def update
    respond_to do |format|
      if @course_subject.update(course_subject_params)
        format.html { redirect_to @course_subject, notice: 'Course subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_subject }
      else
        format.html { render :edit }
        format.json { render json: @course_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_subjects/1
  # DELETE /course_subjects/1.json
  def destroy
    @course_subject.destroy
    respond_to do |format|
      format.html { redirect_to course_subjects_url, notice: 'Course subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_subject
      @course_subject = CourseSubject.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_subject_params
      params.require(:course_subject).permit(:subject, :course)
    end
end
