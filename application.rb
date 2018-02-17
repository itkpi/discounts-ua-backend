require 'bundler'
Bundler.require(:default)
Bundler.require(:development) if development?
require 'sinatra/reloader' if development?
Dir['./app/models/*.rb'].each { |file| require file }
Dir['./config/*.rb'].each { |file| require file }
Dir['./lib/*.rb'].each { |file| require file }
Dir['./app/serializers/*.rb'].each { |file| require file }
set :serializers_path, './models/serializers'

before do
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'GET'
  headers['Access-Control-Request-Method'] = '*'
  headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
end

get '/api/shops' do
  shops = Shop.includes(discount_types: { periods: :discounts }).all
  json shops: shops.as_json
end

get '/api/shops/:slug' do
  shop = Shop.includes(discount_types: { periods: :discounts }).find_by(slug: params[:slug])
  if shop.discount_types.none?(&:active_period)
    Thread.new { ShopParser.new(shop).call }
    json(started_parsing: true)
  else
    json ShopSerializer.new(shop)
  end
end
