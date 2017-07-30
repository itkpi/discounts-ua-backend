require 'bundler'
Bundler.require(:default)
require 'sinatra/reloader' if development?
Dir['./models/*.rb'].each { |file| require file }
Dir['./models/serializers/*.rb'].each { |file| require file }
Dir['./shop_parsers/*.rb'].each { |file| require file }
Dir['./shop_parsers/**/*.rb'].each { |file| require file }
set :serializers_path, './models/serializers'

get '/' do
  check_existance_of_shops
  check_existance_of_active_periods
  shops = Shop.includes(discount_types: { periods: :discounts }).all
  slim :index, locals: { shops: shops }
end

get '/api/discounts' do
  shops = Shop.includes(discount_types: { periods: :discounts }).all
  { shops: shops }.to_json
end

get '/image-proxy/' do
    headers['Content-Type'] = 'image/jpeg'
    headers['Cache-Control'] = 'public'
    headers['Expires'] = Date.today + 1.year
    open(Base64.urlsafe_decode64 params[:url]).read
end

def image_proxy_url(url)
  "/image-proxy/?url=#{Base64.urlsafe_encode64 url}"
end

def check_existance_of_shops
  Shop.create_all
end

def check_existance_of_active_periods
  Shop.all.each do |shop|
    shop.discount_types.each do |discount_type|
      unless discount_type.active_period
        shop.name.camelize.constantize
            .send(discount_type.name.to_sym)
      end
    end
  end
end

helpers do
  def format_price(price)
    format('%.2f', price)
  end
end
