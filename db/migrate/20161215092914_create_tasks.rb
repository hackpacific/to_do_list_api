class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, index: true
      t.string :content
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
