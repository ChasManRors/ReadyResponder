class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :description
      t.references :commentable, :polymorphic => true
      t.references :person
      t.timestamps null: false
    end
  end
end
