require_relative '../../db/config'

class Teacher < ActiveRecord::Base

  validates :email, uniqueness: true
  has_many :teacher_assignments
  has_many :students, through: :teacher_assignments

end

# Teacher.create(name: "Mr. Rogers", email: "mr.rogers@mrrogers.mrrogers", phone: "7777777777")
# Teacher.create(name: "Mike Busch", email: "buschymike@gmail.com", phone: "1234567890")
# Teacher.create(name: "Dumbledore", email: "themaster@hogwarts.com", phone: "345434543000")