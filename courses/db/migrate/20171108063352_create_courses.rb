class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :description
      t.text :materials, null: false
      t.text :questions, null: false

      t.timestamps
    end
  end
end
