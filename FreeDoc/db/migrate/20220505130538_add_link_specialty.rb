class AddLinkSpecialty < ActiveRecord::Migration[5.2]
  def change
    add_reference :specialties, :doctor, foreign_key: true
  end
end
