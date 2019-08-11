class AddProfiletextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_text, :text
  end
end
