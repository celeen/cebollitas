class WelcomeController < ApplicationController
  protect_from_forgery with: :exception

  def index
    puts File.expand_path(Rails.root)
    puts File.expand_path(Rails.root) + "/app/assets/images/"
    @banner_photos = Dir.entries(
      File.expand_path(
        Rails.root
      ) + "/app/assets/images/intro-banner/"
    ).select {|filename| filename[-3..-1] == "png"}

    @next_market = NextMarket.new
  end

  def donate
  end
end
