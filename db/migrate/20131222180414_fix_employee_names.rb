class FixEmployeeNames < ActiveRecord::Migration
  def change
    Employee.all.each do |employee|
      info = employee.first_name.split
      employee.first_name = info[0]
      employee.last_name = info[1]
      employee.email = info[2]
      employee.save!
    end
  end

end

