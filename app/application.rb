class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  @@items = []
  if req.path.include?"/items/"
    Item.all.each do |item|
      @@items << item.name
      if req.path == "/item/#{item.name}"
        resp.write "#{item.price}"
end
