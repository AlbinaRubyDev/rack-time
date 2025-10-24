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
    @unknown = @time_params - DATETIME_FORMATS.keys
  end

  def valid_format?
    if @unknown.any?
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

  def return_body_unknown
    @body = "Unknown time format [#{@unknown.join(',')}]"
  end

  def body
    @body
  end

  private

  def parse(request)
    request.params['format']&.split(',') || []
  end
end
