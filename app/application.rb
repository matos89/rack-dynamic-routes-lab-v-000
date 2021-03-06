require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      searched_item = req.path.split("/items/").last
      got_item = @@items.find {|o| o.name == "#{searched_item}"}

        if got_item != nil
          resp.write "#{got_item.price}"
        else
          resp.write "Item not found"
          resp.status = 400
        end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
