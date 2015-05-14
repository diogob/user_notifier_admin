Rails.application.routes.draw do

  mount UserNotifierAdmin::Engine => "/user_notifier_admin"
end
