class AddCustomerIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :customer_id, :integer

    Sale.all.each do |sale|
      customer = Customer.find_or_create_by(account_number: sale.customer_and_account_no)
      sale.customer_id = customer.id
      sale.save!
    end

  end

  def down
    remove_column :sales, :customer_id, :integer

  end
end
