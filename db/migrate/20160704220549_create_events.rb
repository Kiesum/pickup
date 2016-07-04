class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :sport
      t.float :latitude
      t.float :longitude
      t.datetime :datetime
      t.integer :min_num_players
      t.integer :max_num_players
      t.text :description

      t.timestamps null: false
    end
  end
end
