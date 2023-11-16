class ChangeColumn < ActiveRecord::Migration[7.1]
  def change
    change_column(:shortened_urls, :short_url, :string, null: true)
  end
end
