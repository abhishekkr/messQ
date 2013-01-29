# MessQ::Agent

module MessQ
  module Agent

    def self.enqueue(msg)
      client "enq #{msg}"
    end

    def self.dequeue
      client 'deq'
    end

    def self.client(cmd)
      begin
        TCPSocket.open(MessQ.host, MessQ.port) do |socket|
          socket.puts cmd
          server_says = socket.read
          socket.flush
          socket.close
          return server_says
        end
      rescue
        MessQ::Verbose.logme 'Can not connect to MessQ.'
      end
    end
  end
end
