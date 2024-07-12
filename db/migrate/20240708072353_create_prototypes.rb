class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      # DBの内容
      t.string :title,      default: "",  presence: true
      t.text :catch_copy,   presence: true
      t.text :concept,      presence: true
      t.references :user,   presence: true
      t.timestamps

      validates :image, presence: true
    
      
    end
  end
end