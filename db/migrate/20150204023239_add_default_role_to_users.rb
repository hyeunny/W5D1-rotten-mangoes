class AddDefaultRoleToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :roles, ["user"])
  end
end
