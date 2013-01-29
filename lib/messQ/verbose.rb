# MessQ::Verbose

module MessQ
  module Verbose

    def self.logme(message)
      puts "sockQ> #{message}"
      File.open(MessQ.logfile, 'a'){|fyl| fyl.puts message}
    end
  end
end
