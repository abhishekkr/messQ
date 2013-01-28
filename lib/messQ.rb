# messQ

messq_libs = File.join(File.dirname(File.expand_path __FILE__), 'messQ', '*.rb')
Dir.glob(messq_libs).each do |lib|
    require lib
end

require 'socket'

module MessQ

  class << self
    attr_accessor :host
    attr_accessor :port
    attr_accessor :q
  end

  def self.messQ_server
    @host ||= '0.0.0.0'
    @port ||= 5566
    @q    ||= []
    begin
      webserver = TCPServer.new(@host, @port)
      puts "messQ has been started at #{@host}:#{@port}"
      while (session = webserver.accept)
        request = session.gets
        Thread.start(session, request) do |session, request|
          if request.match(/[eE][nN][qQ]\ /)
            @q << request.gsub(/[eE][nN][qQ]\ /, '').chomp
            logme "added to messQ: #{@q[-1]}"
            session.print @q[-1]
          elsif request.match(/[dD][eE][qQ]/)
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

  def self.logme(message)
    puts message
  end
end
