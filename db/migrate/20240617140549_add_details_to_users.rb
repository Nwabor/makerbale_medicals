class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :address, :string
    add_column :users, :profile_pic, :text
  end
end
