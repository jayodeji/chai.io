class RenamePasswordDigestField < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :old_password, null: false, default: ""
    end

    User.update_all("old_password=password_digest")
  end
end
