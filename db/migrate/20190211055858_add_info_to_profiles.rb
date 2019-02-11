class AddInfoToProfiles < ActiveRecord::Migration
  def change
  	change_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :age_range
      t.string :gender
      t.string :location
      t.string :bio
      t.string :instagram_profile
      t.string :facebook_profile
      t.string :mobile_number
      t.integer :facebook_followers
      t.integer :instagram_followers
      t.string :favorites
      t.string :email
    end
  end
end
