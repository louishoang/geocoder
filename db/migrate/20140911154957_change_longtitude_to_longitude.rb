class ChangeLongtitudeToLongitude < ActiveRecord::Migration
  def up
    remove_column :users, :longtitude, :float
    add_column :users, :longitude, :float
  end

  def down
    add_column :users, :longtitude, :float
    remove_column :users, :longitude, :float
  end
end
