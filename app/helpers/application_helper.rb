module ApplicationHelper

  #logo
  def logo
    image_tag("logo.png", :alt => "Counter Measure", :class => "round")
  end

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
