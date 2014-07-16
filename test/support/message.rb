class Message
  def self.build_attributes(host, port)
    {
      host: host,
      port: port,
      domain: "example.com",
      from: "me@example.com",
      to: ["you@example.com", "we@example.com"],
      header: {"Subject"=>"Email subject line", "Reply-to"=>"me@example.com"},
      body: "Not much of interest here."
    }
  end
end