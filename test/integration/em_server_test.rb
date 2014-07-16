require "test_helper"

class EmServerTest < MiniTest::Unit::TestCase
  def setup
    @em_host = 'localhost'
    @em_port = 2525

    @connection = nil
    @message_params = Message.build_attributes(@em_host, @em_port)
  end

  def test_multiple_recipients
    EM.run {
      EM.start_server(@em_host, @em_port, MailSandbox::Server) { |conn| @connection = conn }
      EM::Timer.new(5) { EM.stop }
      EM::Protocols::SmtpClient.send(@message_params)
    }

    assert_equal( c.message.recipients, ["<you@example.com>", "<we@example.com>"] )
  end
end
