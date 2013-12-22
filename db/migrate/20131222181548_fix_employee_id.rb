class FixEmployeeId < ActiveRecord::Migration
  def change
    Employee.all.each do |employee|
      sales = Sale.where(:employee => "#{employee.first_name} #{employee.last_name} #{employee.email}")
      sales.each do |sale|
        sale.employee_id = employee.id
        sale.save!
      end
    end
  end

end
