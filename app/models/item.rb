# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  category_id         :bigint(8)
#

class Item < ApplicationRecord
  belongs_to :category

  def price
    if has_discount || discount_percentage != 0
      original_price * (1 - (discount_percentage.to_f / 100))
    else
      original_price
    end
  end

  def self.average_price
    sum = 0
    Item.all.find_each do |i|
      sum += i.price
    end

    sum / Item.count
  end
end
