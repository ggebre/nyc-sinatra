
class CreateFigures <  ActiveRecord::Migration
    def change 
        create_table :figures do |t|
            t.text :name
        end
    end
end