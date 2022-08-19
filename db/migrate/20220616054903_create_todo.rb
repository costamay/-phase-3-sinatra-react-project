class CreateTodo < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :task
      t.integer :category_id
      t.timestamps
    end
  end
end
