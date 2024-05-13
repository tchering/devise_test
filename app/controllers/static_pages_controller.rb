class StaticPagesController < ApplicationController
  def home
    return unless user_signed_in? && current_user

    @micropost = current_user.microposts.build
    @feed_items = current_user.feed
    # here we are calling the feed method in current_user which is instance of User model. Therefore the feed method should be defined in User model.
  end

  def about; end

  def contact; end
end
