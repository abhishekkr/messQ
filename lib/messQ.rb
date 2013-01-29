# messQ

messq_libs = File.join(File.dirname(File.expand_path __FILE__), 'messQ', '*.rb')
Dir.glob(messq_libs).each do |lib|
    require lib
end

require 'socket'

module MessQ

  class << self
    attr_accessor :host, :port, :q
    attr_accessor :pid, :pidfile, :logfile
  end
  @host ||= '0.0.0.0'
  @port ||= 5566
  @q    ||= []
  @pidfile = File.join(File.dirname(__FILE__), '..', 'bin', 'pidfile')
  @logfile = File.join(File.dirname(__FILE__), '..', 'bin', 'messQ.log')

  def self.messQ_server
    begin
      Process.daemon(true)
      @pid = Process.fork do
        MessQ::Server.start
      end
      File.open(@pidfile, 'w'){|fyl| fyl.puts @pid}
      MessQ::Verbose.logme "MessQ server PID:#{@pid}"
    rescue
      MessQ::Verbose.logme "messQ failed."
    end
  end
end
