# 1. ARRAYS
# arr = [1, 2, 3, 4, 5]
# puts arr
# puts arr.reverse


# 2. CLI INPUT
# puts 'Multiply any number by 2'
# input = gets.chomp
# puts input.to_i * 2


# 3. HOMEWORK
# puts "Enter your first name:"
# first = gets.chomp
# first_len = first.length

# puts "Enter your last name:"
# last = gets.chomp
# last_len = last.length

# puts "Your full name is: #{first} #{last}"
# puts "Your full name reversed is: #{first.reverse} #{last.reverse}"
# puts "Your name has #{first_len + last_len} characters in it"


# 4. RANGES & ARRAY CONVERSION
# abc = "a".."z"
# p abc.to_a

# x = 1..100
# y = x.to_a
# z = y.shuffle
# puts x.class
# p y
# p z
# odd = y.select { |num| num.odd? }
# even = y.select { |num| num.even? }
# p even.reverse!

# .reverse! AND SIMILAR EXCLAMATIONS MUTATE THE OBJECT STATE


# 5. HASHES
# example = { 'a' => 1, 'b' => 2, 'c' => 3, e: 4 }
# example.each { |key, val| puts "The type is #{key.class} and the value is #{val}" }

# SYMBOLS ARE NEW-ISH TO RAILS AND COUNT AS AN IDENTITY
# sample = example.select { |key, val| key.is_a?(Symbol) }
# puts sample


# 6. HOMEWORK
# users = [
#   { username: 'matt', password: '1234' },
#   { username: 'jack', password: 'jack' },
#   { username: 'kyle', password: 'ok123' }
# ]

# def auth_user(username, password, all_users)
#   all_users.each do |user|
#     if user[:username] == username && user[:password] == password
#       return user
#     end
#   end

#   "Credentials were not correct"
# end

# puts "Welcome to Authenticator"
# 25.times { print "-" }
# puts

# attempts = 1

# while attempts < 4
#   # GET USERNAME
#   print "Username: "
#   username = gets.chomp

#   # GET PASSWORD
#   print "Password: "
#   password = gets.chomp

#   # RETURN USER OR ERROR
#   auth = auth_user(username, password, users)
#   puts auth

#   # EXIT AFTER 3 ATTEMPTS
#   attempts += 1
#   puts "You have reached the maximum amount of attempts" if attempts == 4
#   break if attempts == 4

#   # EXIT OR CONTINUE
#   puts "Enter q to quit or any other key to continue"
#   input = gets.chomp.downcase
#   break if input == "q"
# end


# 7. HOMEWORK
# cities = {
#   'El Cajon' => '619',
#   'Sacremento' => '916',
#   'San Diego' => '858',
#   'San Francisco' => '415'
# }

# def get_city_names(hash)
#   puts hash.keys
# end

# def get_area_code(hash, key)
#   if hash[key]
#     puts "The area code for #{key} is #{hash[key]}"
#   else
#     puts "Please enter a valid city"
#     return false
#   end
# end

# loop do
#   puts "Do you want to lookup an area code based on a city name? (Y/N)"
#   choice = gets.chomp.downcase

#   if choice == 'n'
#     break
#   elsif choice != 'y'
#     puts "Error: Choose a valid response (Y/N)"
#   else
#     puts "Which city do you want the area code for?"
#     get_city_names(cities)
#     print "Enter your selection: "

#     city = gets.chomp
#     result = get_area_code(cities, city)

#     break if result == false
#   end
# end


# 8. CLASSES
# class Student
#   attr_accessor :first_name, :last_name, :email, :user, :password
#   attr_reader :username

#   @first_name
#   @last_name
#   @email
#   @user
#   @username
#   @password

#   # REDUNDANT GETTER / SETTER PATTERN
#   def first_name=(first)
#     @first_name = first
#   end

#   def first_name
#     @first_name
#   end

#   def initialize(first_name, last_name, email, user, password)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @user = user
#     @password = password
#   end

#   def set_username
#     # HARD CODED VALUE
#     @username = "mjmeilahn"
#   end

#   def to_s
#     "First name: #{@first_name}"
#   end
# end

# # INITIALIZE CLASS
# matt = Student.new("Matthew", "Meilahn", "mjm@mjm.com", "mjmeilahn", "1234")

# # USING attr_accessor
# # matt.first_name = "Matt"
# # matt.last_name = "Meilahn"
# puts "First: #{matt.first_name}"
# puts "Last: #{matt.last_name}"
# puts "User: #{matt.user}"

# # USING attr_reader
# puts "Username: #{matt.set_username}"


# 9. FINAL PROJECT
module AuthUser
  require 'bcrypt'

  def self.create_hash (str)
    BCrypt::Password.create(str)
  end

  def self.verify (str)
    BCrypt::Password.new(str)
  end

  def self.secure_users (users)
    users.each do |user|
      user[:password] = create_hash(user[:password])
    end

    users
  end

  def self.auth_user (username, password, users)
    found = false

    users.each do |user|
      if user[:username] == username && verify(user[:password]) == password
        found = true
        return user
      end
    end

    unless found
      puts "Credentials were not correct"
    end
  end
end