# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true 
    validates :long_url, presence: true, uniqueness: true 


    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    def self.random_code 
        url = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(url)
             url = SecureRandom.urlsafe_base64
        end
        url 
    end    

    def after_initialize
        generate_short_url
    end    


    private 
    def generate_short_url
        if self.short_url.nil?
            self.short_url = ShortenedUrl.random_code
        end     
    end    

end
