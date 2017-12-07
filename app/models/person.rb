class Person < ApplicationRecord
  belongs_to :category



  def to_param
    "#{self.number}"
  end
end
