# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!


class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  def self.all #displays all contacts by full name
    @@contacts.each { |contact| puts contact.full_name }
  end

  def self.find(id) #find contact by id
    @@contacts.find { |contact| contact.id == id }
  end

  def update(field_name, value) #UNDER CONSTRUCTION
    # This method should allow you to specify
    # 1. which of the contact's attributes you want to update
    # 2. the new value for that attribute
    # and then make the appropriate change to the contact
  end

  def self.find_by(field_name, value) #search contacts by field_name
    case field_name
    when "first_name" then index = @@contacts.find_index { |contact| contact.first_name == value }
    when "last_name" then index = @@contacts.find_index { |contact| contact.last_name == value }
    when "email" then index = @@contacts.find_index { |contact| contact.email == value }
    end

    if index != nil
      puts @@contacts[index].full_name
    else
      puts "Contact not found"
    end
  end

  def self.delete_all # delete all of the contacts in the contacts array
    @@contacts.clear
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
