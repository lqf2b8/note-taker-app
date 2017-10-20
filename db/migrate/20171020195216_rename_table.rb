class RenameTable < ActiveRecord::Migration[5.1]
  def change
  	rename_table :tweets, :subjects
  end
end
