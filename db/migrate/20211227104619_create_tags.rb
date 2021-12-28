class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :color, default: 'white'

      t.belongs_to :board
      t.has_and_belongs_to_many :card

      t.timestamps
    end
  end
end
