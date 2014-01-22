require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  validates :email, format: { with: /\w+@\w+\.\w{2,}/,
    message: "You have not provided a valid email address." }
  validates :email, uniqueness: true
  validate :age_validation
  validate :phone_validation


  def age_validation
    if age < 5
      errors.add(:age, "No youngins")
    end
  end

  def phone_validation
    if scrub_phone.length < 10
      errors.add(:phone, "Invalid phone format")
    end
  end

  def scrub_phone
    phone.gsub(/\D/, "")
  end

  def name
    "#{first_name} #{last_name}"
    #{}"#{self.read_attribute(first_name)} #{self.read_attribute(last_name)}"
  end

  def age
    ((Date.today - birthday)/365.25).floor
  end
end