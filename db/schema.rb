ActiveRecord::Schema.define() do

    create_table "urls", force: :cascade do |t|
        t.string "original_url", null: false
        t.string "short_url", null: false
        t.integer "click_count", default: 0
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["original_url"], name: "index_urls_on_original_url", unique: true
        t.index ["short_url"], name: "index_urls_on_short_url", unique: true
    end

end