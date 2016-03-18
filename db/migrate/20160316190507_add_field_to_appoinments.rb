class AddFieldToAppoinments < ActiveRecord::Migration
  def change
    add_column :appointments, :first_name, :text
    add_column :appointments, :last_name, :text
    add_column :appointments, :comments, :text
  end
end
