module AdminBlogsHelper

	def admin_posts_form_path(post)
		if post.new_record?
			admin_posts_path
		else
		    admin_post_path(post)
		end	
	end
end
