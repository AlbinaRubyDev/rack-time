class TimeHandler

  DATETIME_FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(request)
    @body = []
    @time_params = parse(request)
  end

  def is_the_format_known?
    unknown = @time_params - DATETIME_FORMATS.keys
    if unknown.any?
      @body = return_body_unknown(unknown)
      false
    else
      true
    end
  end

  def return_time_in_format
    @time_params.each do |param|
      @body << Time.now.strftime(DATETIME_FORMATS[param])
    end
    @body = @body.join('-')
  end

  def body
    @body
  end

  private

  def return_body_unknown(unknown)
    "Unknown time format [#{unknown.join(',')}]"
  end

  def parse(request)
    request.params['format']&.split(',') || []
  end
end
