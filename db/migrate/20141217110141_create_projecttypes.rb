class CreateProjecttypes < ActiveRecord::Migration
  def change
    create_table :projecttypes do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
