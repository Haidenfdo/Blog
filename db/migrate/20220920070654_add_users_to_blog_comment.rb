class AddUsersToBlogComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :blog_comments, :users, null: false, foreign_key: true
  end
end
