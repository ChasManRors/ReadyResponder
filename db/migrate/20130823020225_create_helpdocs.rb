class CreateHelpdocs < ActiveRecord::Migration[4.2]
  def change
    create_table :helpdocs do |t|
      t.string :title
      t.text :contents
      t.string :help_for_view
      t.string :help_for_section

      t.timestamps
    end
  end
end
