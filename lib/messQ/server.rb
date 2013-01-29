# MessQ::Server

module MessQ
  module Server

    def self.start
      begin
        webserver = TCPServer.new(MessQ.host, MessQ.port)
        MessQ::Verbose.logme "messQ has been started at #{MessQ.host}:#{MessQ.port}"
        while (session = webserver.accept)
          MessQ::Session.handler session
        end
      rescue
        MessQ::Verbose.logme "messQ failed starting at #{MessQ.host}:#{MessQ.port}."
      end
    end

    def self.stop
      return unless File.exists? MessQ.pidfile
      MessQ.pid = File.read(MessQ.pidfile).strip.to_i
      MessQ::Verbose.logme  "Killing PID: #{MessQ.pid}"
      Process.kill(15, MessQ.pid)
    end
  end
end
