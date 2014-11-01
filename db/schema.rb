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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110308060631) do

  create_table "coords", :force => true do |t|
    t.decimal  "latitude",   :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "longitude",  :precision => 15, :scale => 10, :default => 0.0
    t.integer  "position"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "icons", :force => true do |t|
    t.string   "name"
    t.string   "file_name"
    t.string   "file_type"
    t.integer  "file_size"
    t.binary   "file_data",  :limit => 2097152
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "heading",                       :default => 0
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.boolean  "frontpage"
  end

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "enabled",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.integer  "width",       :default => 4
  end

  create_table "routes_stops", :id => false, :force => true do |t|
    t.integer "stop_id"
    t.integer "route_id"
  end

  create_table "statuses", :force => true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code"
    t.boolean  "public",     :default => true
  end

  create_table "stops", :force => true do |t|
    t.string   "name"
    t.decimal  "latitude",    :default => 0.0
    t.decimal  "longitude",   :default => 0.0
    t.boolean  "enabled",     :default => true
    t.string   "phonetic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.text     "description"
    t.string   "address"
    t.string   "time_served"
  end

  create_table "updates", :force => true do |t|
    t.integer  "vehicle_id"
    t.decimal  "latitude",    :default => 0.0
    t.decimal  "longitude",   :default => 0.0
    t.integer  "heading"
    t.integer  "speed"
    t.datetime "timestamp"
    t.integer  "lock"
    t.integer  "status_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["vehicle_id", "timestamp"], :name => "index_updates_on_vehicle_id_and_timestamp"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",           :default => false
  end

  create_table "vehicles", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.boolean  "active_override", :default => false
    t.boolean  "enabled",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "icon_id"
  end

end
