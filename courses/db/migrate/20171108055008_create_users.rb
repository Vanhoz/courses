class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
      t.string :password_digest, null: false
      t.boolean :admin_role, null: false, default: false

      t.timestamps
    end
  end
end
