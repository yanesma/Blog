class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer

    add_index :posts, [:user_id]
  end

  def self.down
    remove_column :posts, :user_id

    remove_index :posts, :name => :index_posts_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
