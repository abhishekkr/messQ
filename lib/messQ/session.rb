# MessQ::Session

module MessQ
  module Session

    def self.handler(session)
      request = session.gets
      Thread.start(session, request) do |session, request|
        if request.match(/[eE][nN][qQ]\ /)
          MessQ.q << request.gsub(/[eE][nN][qQ]\ /, '').chomp
          MessQ::Verbose.logme "added to messQ: #{MessQ.q[-1]}"
          session.print MessQ.q[-1]
        elsif request.match(/[dD][eE][qQ]/)
          deq = MessQ.q.shift
          MessQ::Verbose.logme "removed from messQ: #{deq}"
          session.print deq
        end
        session.close
      end
    end
  end
end
