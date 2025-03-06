class AddStatusToJob < ActiveRecord::Migration[7.2]
  def change
    add_column :jobs, :status, :integer
    #rename_column :users, :mobile, :mobile_number
  end
end
