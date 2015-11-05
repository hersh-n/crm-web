class Contact
  attr_accessor :first_name, :last_name, :email, :note, :id
  @@contacts = []
  @@id = 1000

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  def self.delete_all
    @@contacts = []
    @@id = 1
  end

  def delete
    @@contacts.delete(self)
  end

  def self.all
    @@contacts
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  def update(field, new_value)
    if field == "note"
      self.note = new_value
    elsif field == "first_name"
      self.first_name = new_value
    elsif field == "last_name"
      self.last_name = new_value
    elsif field == "email"
      self.email = new_value
    end
  end

  def self.search_by_attribute(search, result)
    array = []
    if search == "first_name"
      @@contacts.each do |find|
        if find.first_name == result
          array << find
        end
      end
    elsif search == "last_name"
      @@contacts.each do |find|
        if find.last_name == result
          array << find
        end
      end
    elsif search == "email"
      @@contacts.each do |find|
        if find.email == result
          array << find
        end
      end
    elsif search == "note"
      @@contacts.each do |find|
        if find.note == result
          array << find
        end
      end
    end
    array
  end


  def self.get(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  def self.find(contact_id)
    @@contacts.find { |contact| contact.id == contact_id }
  end
end
