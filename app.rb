require_relative 'time_handler'

class App

  def call(env)
    request = Rack::Request.new(env)
    return not_found unless request.path_info == '/time'
    further_processing(request)
  end

  private

  def further_processing(request)
    binding.irb
    #
    #нужно проверить: это известные форматы или белиберда?
    #
    #если белиберда - вернуть статус - 400, headers, тело - "Unknown time format [epoch]"
    #(если неизвестных форматов несколько, 
    #все они должны быть перечислены в теле ответа, например: "Unknown time format [epoch, age]")
    #
    #если все норм, 
    #готовимся вернуть ответ
    #вернуть статус - 200, headers, тело - сформированный ответ
    #!они могут быть в любом порядке
    #
  end

  def ok
    response(200, ['надо подготовить'])
  end

  def unknown_format
    response(400, ['надо подготовить'])
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
