module ApplicationHelper

  def people_filiters(options)
    params.permit(:category, :order).merge(options)
  end

end
