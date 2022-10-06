class AddUsersToNewBlog < ActiveRecord::Migration[6.1]
  def change
    add_reference :new_blogs, :users, null: false, foreign_key: true
  end
end
