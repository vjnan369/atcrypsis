# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150710122427) do

  create_table "downloads", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "fund"
    t.string   "rating"
    t.integer  "minimum_investment"
    t.string   "exit_load"
    t.decimal  "expense_ratio"
    t.string   "portfolio_manager"
    t.decimal  "one_month_return"
    t.string   "one_month_rank"
    t.decimal  "three_month_return"
    t.string   "three_month_rank"
    t.decimal  "one_year_return"
    t.string   "one_year_rank"
    t.decimal  "three_year_return"
    t.string   "three_year_rank"
    t.decimal  "five_year_return"
    t.string   "five_year_rank"
    t.decimal  "ten_year_return"
    t.string   "ten_year_rank"
    t.string   "category"
    t.string   "launch"
    t.decimal  "net_assets"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
