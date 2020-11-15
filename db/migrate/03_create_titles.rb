class CreateTitles < ActiveRecord::Migration
    def change
        create_table :titles do |t|
            t.text :name
        end
    end

end