class RemovePasswardFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :passward, :string
  end
end
