require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  validates :email, format: { with: /\w+@\w+\.\w{2,}/,
    message: "You have not provided a valid email address." }
  validates :email, uniqueness: true
  validate :age_validation
  validate :phone_validation

  has_many :teacher_assignments
  has_many :teachers, through: :teacher_assignments


  def full_name
    [first_name, last_name].join(' ')
  end

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
  end

  def age
    ((Date.today - birthday)/365.25).floor
  end

  def self.assign_teacher
    arr = [1,1,2,2,3,3]
    self.find_each { |record| record.update(teacher_id: "#{arr.pop}") }
  end
end


# Student.create(first_name: "Jill", last_name: "Jones", gender: "male", birthday: Time.new(1973, 01, 01), email: "skldhfls@gmail.com", phone: "4567890987")
# Student.create(first_name: "Mark", last_name: "Smith", gender: "male", birthday: Time.new(1973, 01, 01), email: "sdfkhl@gmail.com", phone: "2343256478")
# Student.create(first_name: "Christy", last_name: "Wilson", gender: "female", birthday: Time.new(1973, 01, 01), email: "lwfnlw@gmail.com", phone: "9878999987")
# Student.create(first_name: "Bob", last_name: "Peterson", gender: "male", birthday: Time.new(1973, 01, 01), email: "oooooooooooo@gmail.com", phone: "0099998787")
# Student.create(first_name: "Missouri", last_name: "Masters", gender: "female", birthday: Time.new(1973, 01, 01), email: "kkkkkkkkkkk@gmail.com", phone: "4446555677")
# Student.create(first_name: "Julie", last_name: "Crowe", gender: "female", birthday: Time.new(1973, 01, 01), email: "gggggggggggg@gmail.com", phone: "9994765467")

# Student.assign_teacher