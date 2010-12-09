class AddAuthor < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :posts, :title, :string
    add_column :posts, :author_id, :integer
    remove_column :posts, :author
    remove_column :posts, :user_id
    change_column :posts, :post_date, :date, :null => true

    remove_index :posts, :name => :index_posts_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :posts, [:author_id]
  end

  def self.down
    remove_column :posts, :title
    remove_column :posts, :author_id
    add_column :posts, :author, :string, :null => false
    add_column :posts, :user_id, :integer
    change_column :posts, :post_date, :date, :null => false

    drop_table :authors

    remove_index :posts, :name => :index_posts_on_author_id rescue ActiveRecord::StatementInvalid
    add_index :posts, [:user_id]
  end
end
