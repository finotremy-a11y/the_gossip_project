class MakeCommentsPolymorphic < ActiveRecord::Migration[8.0]
  def change
    remove_column :comments, :gossip_id, :integer

    add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
