class CreateUserImages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_images do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
