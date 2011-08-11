class PagesController < ApplicationController

  def home
    @title = "Home"
    @bicycle = Bicycle.new if signed_in?
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
