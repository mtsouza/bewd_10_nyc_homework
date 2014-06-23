class CreateRitlies < ActiveRecord::Migration
  def change
    create_table :ritlies do |t|
      t.string :link
      t.string :hashcode

      t.timestamps
    end
  end
end
