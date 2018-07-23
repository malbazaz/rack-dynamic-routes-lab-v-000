require 'pry'
class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  @@items = Item.all

    Item.all.each do |item|

      if req.path == "/item/#{item.name}"
      @returned = resp.write "#{item.price}"
      end
    end
    if !@returned
      resp.write "Route not found"
      resp.status = 404
    end
  end
end
