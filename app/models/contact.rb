class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
end

class SendgridMailer
  
 
def send_simple_message(name, email, body)
  RestClient.post "https://api:key-7868acfef368cccc875ebe6cda4a0209"\
  "@api.mailgun.net/v3/sandbox9fd7ea1ad51748f6b916068140ac384f.mailgun.org/messages",
  :from => "#{email}",
  :to => "victorcastro89@hotmail.com",
  :subject => "Contato Site Rails",
  :text => "#{body}"
end

end