class CreateMessageRecipients < ActiveRecord::Migration[8.0]
  def change
    create_table :message_recipients do |t|
      t.references :private_message, null: false, foreign_key: true
      t.references :recipient, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
