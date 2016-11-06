class PagesController < ApplicationController
  protect_from_forgery with: :exception

  def donate
    @content = {title: "Coming Soon!"}
  end

  def terms
    @content = {title: "Terms and Conditions (\"Terms\")"}
  end

  def privacy_policy
    @content = {title: "Privacy Policy"}
  end
end
