module StdoutHelper
  def unstyled_stdout_from(&block)
    original_stdout = $stdout
    $stdout = StringIO.new
    block.call
    unstyled($stdout.string)
  ensure
    $stdout = original_stdout
  end

  def unstyled(string)
    string.gsub(/\e\[([;\d]+)?m/, '')
  end
end
