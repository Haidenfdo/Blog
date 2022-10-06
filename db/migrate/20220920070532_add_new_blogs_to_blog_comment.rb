class AddNewBlogsToBlogComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :blog_comments, :new_blogs, null: false, foreign_key: true
  end
end
