class TimeHandler
  
  DATETIME_FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize()
    @body = []
  end

  def is_the_format_known?
    #проверка белиберда или ок
    #если ок - вернуть истину
    #если не ок - вернуть ложь И заполнить body
    #
    #(если неизвестных форматов несколько, 
    #все они должны быть перечислены в теле ответа, например: "Unknown time format [epoch, age]")
    #
  end

  def return_time_in_format
    #binding.irb
    #готовимся вернуть ответ
    #вернуть статус - 200, headers, тело - сформированный ответ
    #!они могут быть в любом порядке
    #
  end
end
