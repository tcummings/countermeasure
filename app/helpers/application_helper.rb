module ApplicationHelper

  #Title
  def title
    base_title = "Counter Measure"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
