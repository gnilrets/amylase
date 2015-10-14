class RemoveRedshiftSaleforceFromJobSpec < ActiveRecord::Migration
  def change
    remove_column :clients, :salesforce_username
    remove_column :clients, :redshift_schema
  end
end
