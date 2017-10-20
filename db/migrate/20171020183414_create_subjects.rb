class CreateSubjects < ActiveRecord::Migration[5.1]
  def up
    create_table :tweets do |t|
      t.string :title
      t.text :content
      t.integer :user_id
    end
  end

  def down
    drop_table :tweets
  end
end
