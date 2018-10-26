class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :latitude
      t.string :longitude
      t.integer :abduction_reports
      t.boolean :abducted

      t.timestamps
    end
  end
end
