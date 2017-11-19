#coding: utf-8
class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :shosai
      t.datetime :kigen
      t.boolean :kanryo
      t.timestamps
    end
  end
end