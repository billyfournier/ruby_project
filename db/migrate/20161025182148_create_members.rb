class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user
      t.references :group

      t.timestamps null: false
    end
  end
end
