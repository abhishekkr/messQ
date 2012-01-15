require 'socket'

class MessQ
  def initialize(host='0.0.0.0', port=8888)
    @host = host
    @port = port
    @q = []
  end

  def messQ_server
    begin
      webserver = TCPServer.new(@host, @port)
      puts "messQ has been started at #{@host}:#{@port}"
      while (session = webserver.accept)
        request = session.gets
        Thread.start(session, request) do |session, request|
          if request.match(/enq\ /)
            @q << request.gsub(/enq\ /, '').chomp
            logme "added to messQ: #{@q[-1]}"
            session.print @q[-1]
          elsif request.match(/deq/)
            deq = @q.shift
            logme "removed from messQ: #{deq}"
            session.print deq
          end
          session.close
        end
      end
    rescue
      puts "messQ failed starting at #{@host}:#{@port}."
    end
  end

  def logme(message)
    puts message
  end
end

MessQ.new('0.0.0.0', 8888).messQ_server
