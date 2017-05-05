module CommentsHelper
     def user_is_authorized_for_comment?(comment)
        current_user && (current_user == comment.user || current_user.admin?)
     end
     
     def user_has_posts?
          @user.comments.count + @user.posts.count == 0 
     end
end
