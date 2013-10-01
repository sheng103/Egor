class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :posts, :title, :permalink
  end

  def down
  end
end
