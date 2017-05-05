class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  def favorite_for(post)
        favorites.where(post_id: post.id).first
  end
  
  def avatar_url(size)
      gravatar_id = Digest::MD5::hexdigest(self.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
  
  def points
     votes.sum(:value)
  end
   
  def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
  end
  
end
