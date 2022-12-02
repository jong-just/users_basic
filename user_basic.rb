class Users
  @@users = {}
  $user_count = 0
  @@logged_in = false

  def initialize(username, password, email)
    @username = username
    @password = password
    @email = email

    @@users[:username] = username
    @@users[username] = {}
    @@users[username][:password] = password
    @@users[username][:email] = email

    $user_count+=1
  end

  def login(username, password)
    if @@users[username][:password] == password
      @@logged_in = true
      puts "Welcome #{@username}. You have successfully logged in."
    else
      puts "Incorrect password, please try again."
    end
  end

  def logout
    @@logged_in = false
    puts "You have succesfully logged out."
  end

  def change_email(new_email)
    if @@logged_in
      puts "We have successfully changed your email from #{@@users[@username][:email]} to #{new_email}."
      @@users[@username][:email] = new_email
    else
      puts "You are not logged in. Try again after logging in."
    end
  end

  def info
    puts "Username: #{@@users[:username]} | Password: #{hide_password(@@users[@username][:password])} | Email: #{@@users[@username][:email]}"
  end

  def self.all_users
    @@users
  end

  private

  def hide_password(password)
    hidden_password = ""
    @password.length.times do
      hidden_password << "*"
    end

    return hidden_password
  end

end

justin = Users.new("joosteen", "12345", "joosteen96@gmail.com")

puts Users.all_users
