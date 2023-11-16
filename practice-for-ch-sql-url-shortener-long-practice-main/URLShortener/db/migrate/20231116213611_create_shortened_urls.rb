class CreateShortenedUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false 
      t.string :short_url, null: false 
      t.integer :user_id, null: false  

      #    add_index [long_url, short_url
      t.timestamps
    end
    add_index :shortened_urls, :short_url, unique: true
    add_index :shortened_urls, :user_id 
  end
end
