class Image < ApplicationRecord
  belongs_to :product
  # def url
  #   Image.where(url: url)
  # end
end
