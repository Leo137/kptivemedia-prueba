class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.boolean :resolved, null: false, default: false

      t.timestamps
    end
  end
end
