class AddDetailsToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :Fund, :string
    add_column :downloads, :Rating, :string
    add_column :downloads, :minimum_investment, :integer
    add_column :downloads, :exit_load, :string
    add_column :downloads, :expense_ratio, :decimal
    add_column :downloads, :portfolio_manager, :string
    add_column :downloads, :one_month_return, :decimal
    add_column :downloads, :one_month_rank, :string
    add_column :downloads, :three_month_return, :decimal
    add_column :downloads, :three_month_rank, :string
    add_column :downloads, :one_year_return, :decimal
    add_column :downloads, :one_year_rank, :string
    add_column :downloads, :three_year_return, :decimal
    add_column :downloads, :three_year_rank, :string
    add_column :downloads, :five_year_return, :decimal
    add_column :downloads, :five_year_rank, :string
    add_column :downloads, :ten_year_return, :decimal
    add_column :downloads, :ten_year_rank, :string
    add_column :downloads, :category, :string
    add_column :downloads, :launch, :string
    add_column :downloads, :net_assets, :decimal
  end
end
