Rails.application.routes.draw do
  resources :courses do
  	resources :students
    resources :course_subjects
  end
  resources :subjects do
  	resources :course_subjects
    resources :student_subjects
  end
  resources :students do
    resources :student_subjects
  end
  root 'courses#index'

  namespace :api do
    namespace :v1 do
      match 'students' => 'students#get_students', via: :get
    end
  end

end
