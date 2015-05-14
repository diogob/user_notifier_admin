require "user_notifier_admin/engine"

module UserNotifierAdmin
end

ActiveSupport.on_load :active_record do
  require "user_notifier_admin/mailer_preview"
end
