class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content,          null: false
      t.references :prototype,  null: false,  foreign_key: true
      t.references :user,       null: false,  foreign_key: true
      t.timestamps

      belongs_to :user
      belongs_to :prototype
    end
  end
end