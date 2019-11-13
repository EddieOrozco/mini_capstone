class Product < ApplicationRecord
  # adding a ? to the def method will return a boolian
  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
