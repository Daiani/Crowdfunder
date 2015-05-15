class AddPledgeAmountToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :pledge_amount, :integer
  end
end
