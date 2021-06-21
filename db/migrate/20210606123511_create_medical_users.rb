class CreateMedicalUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_users do |t|
      t.string :idpass
      t.string :password_digest

      t.timestamps
    end
  end
end
