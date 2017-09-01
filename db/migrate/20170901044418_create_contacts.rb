class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
