# == Schema Information
# Schema version: 20080605150641
#
# Table name: iterations
#
#  id          :integer(11)     not null, primary key
#  name        :string(255)     
#  description :text            
#  start       :date            
#  deadline    :date            
#  created_at  :datetime        
#  updated_at  :datetime        
#

class Iteration < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :start
  validates_presence_of :deadline
  
  validates_uniqueness_of :name
  
  def validate
    errors.add(:deadline, "should be greater then #{start}.") if deadline < start
  end
  
end
