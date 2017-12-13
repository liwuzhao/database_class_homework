class Person < ApplicationRecord
  belongs_to :category

  validates_presence_of :number, :name, :sex, :age, :work_position, :title, :political_status, :education, :working_time, :come_university_time, :category_id,
                        messages: "不能为空"


  validates_uniqueness_of :number, messages: "该编码已存在"
  validates_numericality_of :age, :greater_than => 17, :less_than => 81


  def to_param
    "#{self.number}"
  end

end
