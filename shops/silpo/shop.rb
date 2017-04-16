require 'open-uri'

module Silpo
  def self.price_of_the_week
    PriceOfTheWeekParser.parse_discounts
  end

  def self.hot_proposal
    HotProposalParser.parse_discounts
  end
end
