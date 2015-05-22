class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :sign

      t.timestamps
    end
  end
end
