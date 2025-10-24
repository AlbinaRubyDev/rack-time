require_relative 'time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)
    further_processing(request)
  end

  private

  def further_processing(request)
    time_handler = TimeHandler.new(request)
    if time_handler.valid_format?
      time_handler.return_time_in_format
      ok(time_handler.body)
    else
      time_handler.return_body_unknown
      unknown_format(time_handler.body)
    end
  end

  def ok(body)
    response(200, body)
  end

  def unknown_format(body)
    response(400, body)
  end

  def not_found
    response(404, 'Not found')
  end

  def response(status, body)
    [status, {}, Array[body]]
  end
end
