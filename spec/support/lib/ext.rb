require 'timeout'

class IO
  def read_all
    read_until('> ')
  end

  def read_until(string)
    Timeout.timeout(5) do
      result = ''
      end_index = 0

      loop do
        result_char = read_nonblock(1)
        p result_char
        result << result_char

        return result if end_index == (string.length - 1)

        if result_char == string[end_index]
          end_index += 1
        else
          end_index = 0
        end
      rescue IO::WaitReadable
        IO.select([self])
        retry
      end
    end
  end
end
