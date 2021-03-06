# Shop has many discount types
# e.g. Silpo has "price_of_the_week" and "hot_proposal"
#
# Schema:
# t.string "slug"
# t.boolean "periodic", default: false
# t.string "name", null: false
# t.integer "shop_id", null: false
# t.string "path"
#
class DiscountType < ActiveRecord::Base
  belongs_to :shop
  has_many :periods, class_name: 'DiscountTypePeriod', foreign_key: 'discount_type_id', dependent: :destroy

  validates :slug, presence: true
  validates :name, presence: true

  delegate :discounts, :start_date, :end_date, to: :active_period

  def url
    shop.url + path
  end

  def active_period
    periods.find_by('end_date >= ?', Date.today)
  end

  def last_updated_at
    discounts.pluck(:created_at).max
  end
end
