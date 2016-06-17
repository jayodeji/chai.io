class AddEncryptedConfigIvDatasource < ActiveRecord::Migration
  def change
    change_table :datasources do |t|
      t.string :encrypted_config_iv
    end
  end
end
