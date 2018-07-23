require 'pry'
class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  @@items = []
    if req.path.include?("/item/")
      binding.pry
      @@items = Item.all
      @@items.each do |item|
        if req.path == "/item/#{item.name}"
          @returned = resp.write "#{item.price}"
        end
      end
    end
    #binding.pry
    if !@returned
      resp.write "Route not found"
      resp.status = 404
    end
end

end
