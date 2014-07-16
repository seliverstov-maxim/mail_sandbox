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

    assert { @connection.message.recipients == ["<you@example.com>", "<we@example.com>"] }
  end

  def test_perfomance
    url = "http://localhost/api"
    stub_request(:any, url).to_return(status: 200)

    observer = MailSandbox::Observer::Http.new(url)
    MailSandbox.subscribe observer
    MailSandbox.logger.level = Logger::ERROR

    EM.run do
      EM.start_server(@em_host, @em_port, MailSandbox::Server) { |conn| @connection = conn }
      EM::Timer.new(7) { EM.stop }
      (1..400).each do
        email = EM::Protocols::SmtpClient.send(@message_params)
      end
    end

    assert_requested :post, url, times: 400

    MailSandbox.unsubscribe observer
    WebMock.reset!
  end
end
