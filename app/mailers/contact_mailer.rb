class ContactMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    attachments[@contact.document.blob.filename.to_s] = {
      mime_type: @contact.document.blob.content_type,
      content: @contact.document.blob.download,
    } if @contact.document.attached?
    mail(to: @contact.email, subject: 'Contact Request') do |format|
      format.html { render layout: 'mailer' }
    end
  end
end
