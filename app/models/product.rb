class Product < ApplicationRecord
  validates :name, presence: true
  validates :nameid, presence: true, length: { minimum: 3, message: '3文字より短いのダメだよ！！' }
  validates :arrival, presence: true, numericality: true, length: { is: 8, message: 'yyyymmdd　なんだから8文字でしょｗ！！' }
  validates :expiration, presence: true,numericality: true, length: { is: 8, message: 'yyyymmdd　なんだから8文字でしょｗ！！' }
  validates :ordering, presence: true
end
