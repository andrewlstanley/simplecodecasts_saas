class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
            
            
            if @contact.save 
                flash[:success] = 'Message sent up up and away!'
                redirect_to new_contact_path
            else
                flash[:danger] = 'Oh no, the lights are not on!'
                redirect_to new_contact_path
            end
    end

    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
    
end