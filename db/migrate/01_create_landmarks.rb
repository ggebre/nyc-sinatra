class CreateLandmarks < ActiveRecord::Migration
  def change 
    create_table :landmarks do |t|
      t.text :name
      t.integer :figure_id
      t.integer :year_completed
    end
  end
end
