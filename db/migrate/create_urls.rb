class CreateUrls < ActiveRecord::Migration[5.2]
    def change
        create_table :urls do |t|
            t.string :original_url, null: false
            t.string :short_url, null: false
            t.integer :click_count, default: 0
            t.timestamps
            t.index :short_url, unique: true
            t.index :original_url, unique: true
        end
    end
end