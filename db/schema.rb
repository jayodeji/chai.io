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

ActiveRecord::Schema.define(version: 20160629061431) do

  create_table "dashboard_reports", force: :cascade do |t|
    t.integer  "dashboard_id", limit: 4
    t.integer  "report_id",    limit: 4
    t.integer  "report_index", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "project_id",  limit: 4
    t.string   "title",       limit: 255
    t.integer  "template_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasource_types", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "datasource_class", limit: 255
  end

  create_table "datasources", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.string   "name",                limit: 255
    t.text     "encrypted_config",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "datasource_type_id",  limit: 4
    t.string   "encrypted_config_iv", limit: 255
  end

  create_table "global_datasources", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "encrypted_config",   limit: 65535
    t.integer  "datasource_type_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "title",           limit: 255
    t.string   "report_type",     limit: 255
    t.integer  "datasource_id",   limit: 4
    t.text     "config",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cache_time",      limit: 4
    t.string   "description",     limit: 255
    t.text     "filters",         limit: 65535
    t.boolean  "sharing_enabled"
    t.text     "sharing_config",  limit: 65535
    t.integer  "project_id",      limit: 4
    t.text     "script",          limit: 65535
    t.boolean  "starred"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "password_digest",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.boolean  "admin"
    t.boolean  "locked"
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "old_password",           limit: 255, default: "", null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
