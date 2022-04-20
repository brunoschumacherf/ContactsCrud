class CreateUsecontacts < ActiveRecord::Migration[6.1]
  def change
    create_table :usecontacts do |t|
      t.string :name
      t.string :relationship
      t.string :phone
      t.string :contactid

      t.timestamps
    end
  end
end
