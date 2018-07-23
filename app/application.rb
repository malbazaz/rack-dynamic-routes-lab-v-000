class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  @@items = []
  if req.path.include?"/items/"
    Item.all.each do |item|
      if req.path == "/item/#{item.name}"
        resp.write "#{item.price}"
      end
    end
  else
    resp.write "Item not found"
    resp.status = 404
  end
end

end
