require_relative 'time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)
    return not_found unless request.path_info == '/time'

    further_processing(request)
  end

  private

  def further_processing(request)
    time_hundler = TimeHundler.new(request)
    if time_hundler.is_the_format_known?
      time_hundler.return_time_in_format
      ok(time_hundler.body)
    else
      unknown_format(time_hundler.body)
    end
  end

  def ok(body)
    response(200, body)
  end

  def unknown_format(body)
    response(400, body)
  end

  def not_found
    response(404, ['Not found'])
  end

  def response(status, body)
    [status, headers, body]
  end

  def headers
    { 'content-type' => 'text/plain' }
  end
end
