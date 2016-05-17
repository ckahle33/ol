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

ActiveRecord::Schema.define(version: 20160517180956) do

  create_table "businesses", force: :cascade do |t|
    t.string   "uuid",             limit: 255
    t.string   "address",          limit: 255
    t.string   "address2",         limit: 255
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.integer  "zip",              limit: 4
    t.string   "country",          limit: 255
    t.string   "phone",            limit: 255
    t.string   "website",          limit: 255
    t.datetime "entry_created_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name",             limit: 255
  end

end
