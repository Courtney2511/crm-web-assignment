# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact < ActiveRecord::Base # by inheriting from AR, the class becomes a database table

  field :first_name, as: :string  #mini record to define the columns of the table
  field :last_name,  as: :string  #sets getters/setters so we don't need attr_accessors
  field :email,      as: :string
  field :note,       as: :text    #we do not define an ID, as ActiveRecord does this automatically


  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!
