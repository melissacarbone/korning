class AddProductIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :product_id, :integer

    Sale.all.each do |sale|
      product = Product.find_or_create_by(name: sale.product_name)
      sale.product_id = product.id
      sale.save!
    end
  end

  def down
    remove_column :sales, :product_id
  end
end
