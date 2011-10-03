class AddPriceToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :decimal
     LineItem.all.each { |line| line.price = line.product.price }
  end

  def self.down
    remove_column :line_items, :price
  end
end
