class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :number, unique: true
      t.string :name
      t.string :sex
      t.integer :age
      t.string :work_position
      t.string :title
      t.string :political_status
      t.string :education
      t.datetime :working_time
      t.datetime :come_university_time
      t.integer :category_id
      t.timestamps
    end
  end
end
