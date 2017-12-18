module PeopleHelper
  def people_filiters(options)
    params.permit(:category, :order).merge(options)
  end


  def category_people_count(category)
    count = 0
    if category.root? && category.has_children?
      category.children.each do |c|
        count += c.people.size
      end
    else
      count = category.people.size
    end
    "#{category.name}" + " ( " + count.to_s + "人 )"
  end

  def render_category_list(category)
    unless category.root?
      link_to(category_people_count(category), people_path(people_filiters(:category => category)), style:"margin-left:10px" )
    else
      link_to(category_people_count(category), people_path(people_filiters(:category => category)) )
    end
  end

end
