require 'json'

module MailSandbox
  class Message

    attr_accessor :data, :recipient, :sender, :completed_at,
        :user,
        :password


    def initialize
      @data = []
    end

    def to_json
      to_a.to_json
    end


    def to_a
      {
        :password => password,
        :user => user,
        :recipient => recipient,
        :sender => sender,
        :completed_at => completed_at,
        :data => data.join("\r\n"),
      }
    end

  end
end