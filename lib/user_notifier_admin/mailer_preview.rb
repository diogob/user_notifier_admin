class UserNotifierAdmin::MailerPreview < ActionMailer::Preview

  def self.create_previews
    Rails.application.eager_load!
    UserNotifier::Base.descendants.each do |model|
      puts "Generating previews for #{model}"
      model.pluck("DISTINCT template_name").each do |template|
        puts "Generating preview for #{template}"
        define_method template do
          notification = model.first
          notification.mailer.notify(notification)
        end
      end
    end
  end

end
