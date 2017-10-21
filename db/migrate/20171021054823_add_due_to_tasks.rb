class AddDueToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :due, :datetime
  end
end
