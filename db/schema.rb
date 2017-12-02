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

ActiveRecord::Schema.define(version: 201711061534181) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "address"
    t.decimal  "lat",              precision: 10, scale: 6
    t.decimal  "lng",              precision: 10, scale: 6
    t.string   "comment"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "logo"
    t.boolean  "is_del",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_cities_on_category_id", using: :btree
    t.index ["city_id"], name: "index_categories_cities_on_city_id", using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.boolean  "is_del"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "city_id"
    t.integer  "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_workers_on_city_id", using: :btree
    t.index ["worker_id"], name: "index_cities_workers_on_worker_id", using: :btree
  end

  create_table "couriers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "city_id"
    t.index ["city_id"], name: "index_couriers_on_city_id", using: :btree
    t.index ["email"], name: "index_couriers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_couriers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "couriers_stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "courier_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courier_id"], name: "index_couriers_stations_on_courier_id", using: :btree
    t.index ["station_id"], name: "index_couriers_stations_on_station_id", using: :btree
  end

  create_table "price_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "grade"
    t.integer  "city_id"
    t.integer  "category_id"
    t.date     "from_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_price_rules_on_category_id", using: :btree
    t.index ["city_id"], name: "index_price_rules_on_city_id", using: :btree
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "price1",     limit: 24, default: 0.0
    t.float    "price2",     limit: 24, default: 0.0
    t.float    "price3",     limit: 24, default: 0.0
    t.float    "price4",     limit: 24, default: 0.0
    t.float    "price5",     limit: 24, default: 0.0
    t.float    "price6",     limit: 24, default: 0.0
    t.integer  "product_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["product_id"], name: "index_prices_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "logo"
    t.boolean  "is_del",      default: false
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "comment"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.boolean  "is_del",     default: false
    t.integer  "city_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["city_id"], name: "index_stations_on_city_id", using: :btree
  end

  create_table "user_addresses", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint   "city_id"
    t.index ["city_id"], name: "index_user_addresses_on_city_id", using: :btree
    t.index ["user_id"], name: "index_user_addresses_on_user_id", using: :btree
  end

  create_table "users", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "cel"
    t.string   "salt"
    t.index ["cel"], name: "index_users_on_cel", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_workers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "workers_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "worker_id"
    t.integer "role_id"
    t.index ["worker_id", "role_id"], name: "index_workers_roles_on_worker_id_and_role_id", using: :btree
  end

  add_foreign_key "categories_cities", "categories"
  add_foreign_key "categories_cities", "cities"
  add_foreign_key "price_rules", "categories"
  add_foreign_key "price_rules", "cities"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "user_addresses", "users"
end
