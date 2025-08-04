class CreateShares < ActiveRecord::Migration[8.0]
  def change
    create_table :shares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
