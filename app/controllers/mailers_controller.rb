class Admin::MailersController < Admin::BaseController

  def index
    @previews = ActionMailer::Preview.all
    @page_title = "Mailer Previews"
  end

  def show
    email = params[:email]
    if resource.email_exists?(email)
      @email = resource.call(email)

      if params[:part]
        part_type = Mime::Type.lookup(params[:part])

        if part = find_part(part_type)
          response.content_type = part_type
          render text: part.respond_to?(:decoded) ? part.decoded : part
        else
          raise AbstractController::ActionNotFound, "Email part '#{part_type}' not found in #{resource.name}##{email}"
        end
      else
        @part = find_preferred_part(request.format, Mime::HTML, Mime::TEXT)
        render action: 'email', layout: false, formats: %w[html]
      end
    else
      raise AbstractController::ActionNotFound, "Email '#{email}' not found in #{resource.name}"
    end
  end

  def resource
    @mailer ||= ActionMailer::Preview.find(params[:id])
  end

  def find_preferred_part(*formats)
    if @email.multipart?
      formats.each do |format|
        return find_part(format) if @email.parts.any?{ |p| p.mime_type == format }
      end
    else
      @email
    end
  end

  def find_part(format)
    if @email.multipart?
      @email.parts.find{ |p| p.mime_type == format }
    elsif @email.mime_type == format
      @email
    end
  end
end

