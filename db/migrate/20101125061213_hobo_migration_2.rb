class HoboMigration2 < ActiveRecord::Migration
  def self.up
    change_column :posts, :author, :string, :null => false, :limit => 255
    change_column :posts, :post_date, :date, :null => false
  end

  def self.down
    change_column :posts, :author, :string
    change_column :posts, :post_date, :date
  end
end
