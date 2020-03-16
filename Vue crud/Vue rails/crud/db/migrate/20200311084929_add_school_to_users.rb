class AddSchoolToUsers < ActiveRecord::Migration[6.0]
  def change #thay doi  them cot 
      add_column :users, :school_id, :integer
  end
end
