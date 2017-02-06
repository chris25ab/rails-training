class EditDescriptionField < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :description, :description
  end
end
