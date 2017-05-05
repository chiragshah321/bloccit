require 'rails_helper'

RSpec.describe Favorite, type: :model do
  
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:favorite) {Favorite.create!(post: post, user: user)}
   
  it { is_expected.to belong_to(:post)}  
  it { is_expected.to belong_to(:user)}  
  
  describe "favorite by user" do
    it "should display favorite post" do
      favorite =  user.favorites.where(post: @post).create
      expect(user.favorite_for(@post)).to eq(favorite)
    end
  
    it "should displays author's gravatar" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(known_user.avatar_url(48)).to eq(expected_gravatar)
    end
  
    it "should display votes on the post" do
      expect( post.points ).to eq(@up_votes - @down_votes)
    end
  
    it "should display number of comments" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end  
end
