require_relative '../../db/config'

class TeacherAssignment < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :student  
end