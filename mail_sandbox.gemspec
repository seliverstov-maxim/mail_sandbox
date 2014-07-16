# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mail_sandbox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kaize"]
  gem.email         = ["info@kaize.ru"]
  gem.description   = %q{Gem has run SMTP server and manipulate letters received. Using the Observer pattern you can subscribe to the event server.}
  gem.summary       = %q{SMTP server sandbox}
  gem.homepage      = "https://github.com/kaize/mail_sandbox"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mail_sandbox"
  gem.require_paths = ["lib"]
  gem.version       = MailSandbox::VERSION

  gem.add_dependency('eventmachine', '~> 1.0.3')
  gem.add_dependency('em-http-request', '~> 1.1.2')
  gem.add_dependency('OptionParser')
  gem.add_dependency('file-utils')
  gem.add_dependency('simple_pid')

  gem.add_development_dependency('rake')
  gem.add_development_dependency('minitest', '4.7.5')
  gem.add_development_dependency('turn')
  gem.add_development_dependency('mocha', '>= 1.1.0')
  gem.add_development_dependency('webmock', '~> 1.18.0')
  gem.add_development_dependency('wrong')
end
