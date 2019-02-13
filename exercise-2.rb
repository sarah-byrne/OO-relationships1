class User
  def initialize(name, bio, age)
    @name = name
    @bio = bio
    @age = age
    @password = password
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end

class SecureUser
  def initialize(name, bio, age, password)
    @user = User.new(name, bio, age)
    @password = password
  end

  def authenticate(candidate_password)
    return true if candidate_password == password
    false
  end

  def profile
    @user.profile
  end

end
