class ContactsController < ApplicationController
  def new
      @contact = Contact.new()
 
  end
     

 
      def create
      @contact = Contact.new(contact_params)
           @sendgrid = SendgridMailer.new
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
doc = <<END

    <p>You have received a message from the site's contact form, from <%= "#{ @name }, #{ @email }." %></p>
    <p><%= #{body} %></p>

END
           @sendgrid.send_simple_message(name, email, doc)
         #  ContactMailer.contact_email(name, email, body).deliver_now
         puts "sents"
          flash[:success] = 'Message sent.'
          redirect_to new_contact_path
        else
          flash[:danger] = 'Error occured, message has not been sent.'
          redirect_to new_contact_path
        end
      end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end