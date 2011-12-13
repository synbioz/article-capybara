class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name

      t.timestamps
    end

    create_table :events_guests, :id => false do |t|
      t.references :event, :guest
    end

    add_index :events_guests, :guest_id
    add_index :events_guests, :event_id
  end
end
