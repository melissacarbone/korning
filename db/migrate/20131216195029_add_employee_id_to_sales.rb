class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer


    Sale.all.each do |sale|
      employee = Employee.find_or_create_by(first_name: sale.employee)
      sale.employee_id = employee.id
      sale.save!
    end
  end

  def down
    remove_column :sales, :employee_id
  end
end
