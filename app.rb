class App

  def call(env)
    request = Rack::Request.new(env)

    binding.irb
    #
    #  если нет - вернуть статус - 404, заголовок - text/plain, тело - что-то вроде "not found"
    #  если есть - проверяем дальше
    #
    #    нужно проверить: это известные форматы или белиберда?
    #    может создать под это отдельный middleware?
    #
    #      если белиберда - вернуть статус - 400, заголовок - text/plain, тело - "Unknown time format [epoch]"
    #      (если неизвестных форматов несколько, 
    #      все они должны быть перечислены в теле ответа, например: "Unknown time format [epoch, age]")
    #
    #      если все норм, 
    #          готовимся вернуть ответ
    #          вернуть статус - 200, заголовок - text/plain, тело - сформированный ответ
    #         !они могут быть в любом порядке
    #
    [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    { 'content-type' => 'text/plain' }
  end

  def body
    ["Welcome abroad!\n"]
  end
end
