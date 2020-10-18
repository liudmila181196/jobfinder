class AddColumnDeletedToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :deleted, :boolean, :null => false, :default=> false
  end
end
