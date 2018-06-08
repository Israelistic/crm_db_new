#!/usr/bin/env ruby
require_relative "contact"
# require 'pry'
class Crm

  def initialize(name)
    @name = name
  end

  def main_menu
      while true
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end

  end
=begin
As a user, upon starting the CRM, I am presented with a prompt to
add, modify, delete, display all, search by attribute, and exit.
=end
  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all contacts"
    puts "[5] Search by attribute"
    puts "[6] delete_all"
    puts "[7] exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then p Contact.all
    when 5 then search_by_attribute
    when 6 then delete_all
    when 7 then exit
    end
  end

    def modify_existing_contact
      # puts "Enter the ID for the user you want to modify"
      # user_id = gets.to_i
      puts "what is the name of the user first, lastname, email you would like to change"
      value = gets.chomp
      modify_menu
      modify_attribute = gets.chomp
      if modify_attribute == "4"
          return
      else
        puts "enter the new value:"
        new_value = gets.chomp
        Contact.find_by(modify_attribute, value).update(modify_attribute, new_value)
      # Contact.find(user_id)
        end
    end
    def modify_menu
      puts "\e[H\e[2J"
      puts "please select an attribute to modify:"
      puts "[1] First_name"
      puts "[2] Last_name"
      puts "[3] Email"
      puts "[4] back"
    end

=begin
As a user, if I select add I am prompted to enter a
 'first name', 'last name', 'email' and 'note'.
=end
  def add_new_contact
    puts "\e[H\e[2J"

    p "enter firstname"
    first_name  = gets.chomp

    p "enter lastname"
    last_name = gets.chomp

    p "enter email address"
    email = gets.chomp

    p "enter note: optional"
    note = gets.chomp

    contact = Contact.create(
    first_name: first_name,
    last_name:  last_name,
    email:      email,
    note:       note
  )
  end


  def delete_contact

  end



  def search_by_attribute
    search_by_menu
    contact_attribute = gets.chomp
    puts "what is the name of the user first, lastname, email, note"
    user_value = gets.chomp
    puts "\e[H\e[2J"
  p  Contact.find_by(contact_attribute, user_value)

    if (contact_attribute == 4 )
        Contact.find_by(contact_attribute, contact.update(contact_attribute, new_value))
    elsif (contact_attribute == 5)
       print_main_menu
    end
  end


  def search_by_menu
    puts "\e[H\e[2J"
    puts "please select an attribute to search by:"
    puts "[1] First_name"
    puts "[2] Last_name"
    puts "[3] Email"
    puts "[4] full_name"
    puts "[5] back"
  end
  def name
    return @name
  end
end

crm1= Crm.new("CRM.APP")
crm1.main_menu
p Contact.find(100)
