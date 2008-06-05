# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080605150641) do

  create_table "iterations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "iteration_id",    :limit => 11
    t.integer  "estimated_hours", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["iteration_id"], :name => "fk_stories_iterations"

  create_table "story_histories", :force => true do |t|
    t.integer  "hours_left", :limit => 11
    t.integer  "story_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "story_histories", ["story_id"], :name => "fk_story_histories_stories"

end
