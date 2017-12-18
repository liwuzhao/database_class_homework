module ApplicationHelper


  def choose_category
    unless category.root?
      f.association :category, label: "人员分类", error: "不能为空"
    else

    end
  end

end
