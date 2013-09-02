class AddKarmapointColToUser < ActiveRecord::Migration
  def change
    add_column :users, :karma_points_sum, :integer, index: true
  end
end
