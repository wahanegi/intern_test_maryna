class CreateTwitts < ActiveRecord::Migration[7.0]
  def change
    create_table :twitts do |t|
      t.text :body
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
