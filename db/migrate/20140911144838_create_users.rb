class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :role, null: false
      user.string :name, null: false
      user.string :address, null: false
      user.float :latitude
      user.float :longtitude

      user.timestamp
    end
  end
end
