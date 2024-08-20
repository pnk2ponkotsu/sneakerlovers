class CreateShoos < ActiveRecord::Migration[6.1]
  def change
    create_table :shoos do |t|
      
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
