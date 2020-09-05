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

ActiveRecord::Schema.define(version: 2020_09_04_021118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payloads", force: :cascade do |t|
    t.integer "store_id"
    t.datetime "date_created"
    t.datetime "date_closed"
    t.datetime "last_updated"
    t.float "total_amount"
    t.float "total_shipping"
    t.float "total_amount_with_shipping"
    t.float "paid_amount"
    t.datetime "expiration_date"
    t.jsonb "order_items", default: [], array: true
    t.jsonb "payments", default: [], array: true
    t.jsonb "shipping", default: "{}"
    t.string "status"
    t.jsonb "buyer", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
