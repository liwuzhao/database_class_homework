class Category < ApplicationRecord

  validates_presence_of :name, message: "名称不能为空"
  validates_uniqueness_of :name, message: "该分类已存在"

  has_ancestry

  has_many :people
end
