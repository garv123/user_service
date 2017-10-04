class CreateSession < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string  :authentication_token
      t.timestamp :expiry_at
      t.integer :user_id
    end
  end
end
