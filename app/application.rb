require 'pry'
class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  @returned = nil
  if req.path.include?("/items/")
      #binding.pry
      Item.all.each do |item|
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
