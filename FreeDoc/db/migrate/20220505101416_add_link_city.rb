class AddLinkCity < ActiveRecord::Migration[5.2]
  def change
    add_reference :cities, :doctor, foreign_key: true
    add_reference :cities, :patient, foreign_key: true
    add_reference :cities, :appointment, foreign_key: true
  end
end
