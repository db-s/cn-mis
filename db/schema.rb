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

ActiveRecord::Schema.define(version: 20141226091728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availabilities", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designations", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designations", ["department_id"], name: "index_designations_on_department_id", using: :btree

  create_table "leavedaytypes", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaves", force: true do |t|
    t.integer  "contact_number"
    t.integer  "reporting_to"
    t.date     "leave_start_date"
    t.date     "leave_end_date"
    t.text     "reason_for_leave"
    t.text     "comments"
    t.integer  "member_id"
    t.integer  "leavetype_id"
    t.integer  "leavedaytype_id"
    t.integer  "leavestatus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaves", ["leavedaytype_id"], name: "index_leaves_on_leavedaytype_id", using: :btree
  add_index "leaves", ["leavestatus_id"], name: "index_leaves_on_leavestatus_id", using: :btree
  add_index "leaves", ["leavetype_id"], name: "index_leaves_on_leavetype_id", using: :btree
  add_index "leaves", ["member_id"], name: "index_leaves_on_member_id", using: :btree

  create_table "leavestatuses", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leavetypes", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "Name"
    t.string   "Email"
    t.date     "Joining_Date"
    t.date     "Confirmation_Date"
    t.string   "hot_Skills"
    t.decimal  "Salary",                       precision: 10, scale: 2
    t.integer  "Reporting_To"
    t.integer  "Earned_Leave",       limit: 2
    t.integer  "Casual_Leave",       limit: 2
    t.integer  "Sick_Leave",         limit: 2
    t.string   "salt"
    t.string   "encrypted_password"
    t.integer  "designation_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["department_id"], name: "index_members_on_department_id", using: :btree
  add_index "members", ["designation_id"], name: "index_members_on_designation_id", using: :btree
  add_index "members", ["location_id"], name: "index_members_on_location_id", using: :btree

  create_table "payments", force: true do |t|
    t.date     "payment_date"
    t.decimal  "payment_amount", precision: 12, scale: 2
    t.text     "payment_desc"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["project_id"], name: "index_payments_on_project_id", using: :btree

  create_table "portfolios", force: true do |t|
    t.text     "project_url"
    t.string   "project_caption"
    t.boolean  "status"
    t.integer  "projecttype_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portfolios", ["project_id"], name: "index_portfolios_on_project_id", using: :btree
  add_index "portfolios", ["projecttype_id"], name: "index_portfolios_on_projecttype_id", using: :btree

  create_table "projectmodes", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "client_name"
    t.string   "client_email"
    t.string   "bdm_name"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "project_cost",     precision: 12, scale: 2
    t.string   "team_members"
    t.integer  "projectstatus_id"
    t.integer  "projecttype_id"
    t.integer  "projectmode_id"
    t.integer  "member_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["department_id"], name: "index_projects_on_department_id", using: :btree
  add_index "projects", ["location_id"], name: "index_projects_on_location_id", using: :btree
  add_index "projects", ["member_id"], name: "index_projects_on_member_id", using: :btree
  add_index "projects", ["projectmode_id"], name: "index_projects_on_projectmode_id", using: :btree
  add_index "projects", ["projectstatus_id"], name: "index_projects_on_projectstatus_id", using: :btree
  add_index "projects", ["projecttype_id"], name: "index_projects_on_projecttype_id", using: :btree

  create_table "projectstatuses", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projecttypes", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
