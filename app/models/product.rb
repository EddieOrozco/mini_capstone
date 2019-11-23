class Product < ApplicationRecord
  # VALIDATES if the everything I want the user to do is CORRECT
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :description, presence: true
  validates :description, length: { in: 3..500 }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
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
