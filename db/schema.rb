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

ActiveRecord::Schema.define(version: 20141122055849) do

  create_table "addresses", force: true do |t|
    t.integer "customer_id",             null: false
    t.string  "type",                    null: false
    t.string  "temperate_zone_division"
    t.string  "postal_code"
    t.string  "prefecture",              null: false
    t.string  "city"
    t.string  "address1"
    t.string  "address2"
    t.string  "company_name"
    t.string  "division_name"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id"
  add_index "addresses", ["type", "customer_id"], name: "index_addresses_on_type_and_customer_id", unique: true

  create_table "customers", force: true do |t|
    t.string   "email",            null: false
    t.string   "email_for_index",  null: false
    t.string   "nickname",         null: false
    t.string   "family_name",      null: false
    t.string   "given_name",       null: false
    t.string   "family_name_kana", null: false
    t.string   "given_name_kana",  null: false
    t.string   "gender"
    t.string   "hashed_password"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email_for_index"], name: "index_customers_on_email_for_index", unique: true
  add_index "customers", ["family_name_kana", "given_name_kana"], name: "index_customers_on_family_name_kana_and_given_name_kana"

  create_table "phones", force: true do |t|
    t.integer  "customer_id",                    null: false
    t.integer  "address_id"
    t.string   "number",                         null: false
    t.string   "number_for_index",               null: false
    t.string   "primary",          default: "f", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["address_id"], name: "index_phones_on_address_id"
  add_index "phones", ["customer_id"], name: "index_phones_on_customer_id"
  add_index "phones", ["number_for_index"], name: "index_phones_on_number_for_index"

  create_table "staff_events", force: true do |t|
    t.integer  "staff_member_id", null: false
    t.string   "type",            null: false
    t.datetime "created_at",      null: false
  end

  add_index "staff_events", ["created_at"], name: "index_staff_events_on_created_at"
  add_index "staff_events", ["staff_member_id", "created_at"], name: "index_staff_events_on_staff_member_id_and_created_at"

  create_table "staff_members", force: true do |t|
    t.string   "email",                            null: false
    t.string   "email_for_index",                  null: false
    t.string   "family_name",                      null: false
    t.string   "given_name",                       null: false
    t.string   "family_name_kana",                 null: false
    t.string   "given_name_kana",                  null: false
    t.string   "hashed_password"
    t.date     "start_date",                       null: false
    t.date     "end_date"
    t.boolean  "suspended",        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "staff_members", ["email_for_index"], name: "index_staff_members_on_email_for_index", unique: true
  add_index "staff_members", ["family_name_kana", "given_name_kana"], name: "index_staff_members_on_family_name_kana_and_given_name_kana"

end
