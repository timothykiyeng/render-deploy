class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :user_id
      t.integer :skill_set_id

      t.timestamps
    end
  end
end
