class CreateNewBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :new_blogs do |t|
      t.string :blog_title
      t.text :blog_description
      t.binary :blog_image

      t.timestamps
    end
  end
end
