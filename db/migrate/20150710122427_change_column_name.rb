class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :downloads, :Fund, :fund
  	rename_column :downloads, :Rating, :rating
  end
end
