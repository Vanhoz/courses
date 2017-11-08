class CreateUsersCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_users do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :course, foreign_key: true, null: false
    end
  end
end
