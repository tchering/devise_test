class AddOccupationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :occupation, :string
    add_index :users, :occupation
  end
end
