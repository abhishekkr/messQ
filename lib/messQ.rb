#!/usr/bin/env ruby

require 'socket'
messq_libs = File.join(File.dirname(File.expand_path __FILE__), 'messq', '*.rb')
Dir.glob(messq_libs).each do |lib|
    require lib
end

module MessQ

  def self.messQ_server(host = '0.0.0.0', port = 8888)
    begin
      webserver = TCPServer.new(host, port)
      puts "messQ has been started at #{host}:#{port}"
      while (session = webserver.accept)
        request = session.gets
        Thread.start(session, request) do |session, request|
          session.print MessQ::Queue.q request, self
          session.close
        end
      end
    rescue
      puts "messQ failed starting at #{host}:#{port}."
    end
  end
end

MessQ.messQ_server('0.0.0.0', 8888)