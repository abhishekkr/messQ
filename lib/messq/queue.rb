# queue.rb

module MessQ
  module Queue

    attr_accessor :queue
    class << self;
      @queue = []
    end

  	def self.q(request, qparent)
  		if request.match(/[eE][nN][qQ]\ /)
        enqueue request.gsub(/[eE][nN][qQ]\ /, '').chomp
      elsif request.match(/[dD][eE][qQ]/)
        dequeue
      end
  	end

  	def self.enqueue(node)
  		self.queue << node
      MessQ::System.logme "added to messQ: #{self.queue[-1]}"
      self.queue[-1]
  	end

  	def self.dequeue
  		deq = self.queue.shift
      MessQ::System.logme "removed from messQ: #{deq}"
      deq
  	end
  end
end