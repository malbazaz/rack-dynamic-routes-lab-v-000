require 'pry'
class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.include?("/items/")
      #binding.pry
      specific_item = req.path.gsub("/items/", "")
      if items = Item.all.find {|item| item.name == (specific_item)}
            resp.write "#{items.price}"
      else
        resp.write "Route not found"
        resp.status = 404
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
end

end
