require_relative 'time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)
    return not_found unless request.path_info == '/time'

    further_processing(request)
  end

  private

  def further_processing(request)
    time_handler = TimeHandler.new(request)
    if time_handler.is_the_format_known?
      time_handler.return_time_in_format
      ok(time_handler.body)
    else
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
    [status, headers, Array[body]]
  end

  def headers
    { 'content-type' => 'text/plain' }
  end
end
