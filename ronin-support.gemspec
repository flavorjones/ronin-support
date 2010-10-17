# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ronin-support}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-17}
  s.description = %q{Ronin Support is a support library for Ronin. Ronin EXT contains many of the convenience methods used by Ronin and additional libraries.}
  s.email = %q{ronin-ruby@googlegroups.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".yardopts",
    "COPYING.txt",
    "ChangeLog.md",
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "lib/ronin/extensions.rb",
    "lib/ronin/extensions/file.rb",
    "lib/ronin/extensions/ip_addr.rb",
    "lib/ronin/extensions/kernel.rb",
    "lib/ronin/extensions/meta.rb",
    "lib/ronin/extensions/meta/object.rb",
    "lib/ronin/extensions/string.rb",
    "lib/ronin/formatting.rb",
    "lib/ronin/formatting/binary.rb",
    "lib/ronin/formatting/digest.rb",
    "lib/ronin/formatting/extensions.rb",
    "lib/ronin/formatting/extensions/binary.rb",
    "lib/ronin/formatting/extensions/binary/file.rb",
    "lib/ronin/formatting/extensions/binary/integer.rb",
    "lib/ronin/formatting/extensions/binary/string.rb",
    "lib/ronin/formatting/extensions/digest.rb",
    "lib/ronin/formatting/extensions/digest/file.rb",
    "lib/ronin/formatting/extensions/digest/string.rb",
    "lib/ronin/formatting/extensions/http.rb",
    "lib/ronin/formatting/extensions/http/integer.rb",
    "lib/ronin/formatting/extensions/http/string.rb",
    "lib/ronin/formatting/extensions/text.rb",
    "lib/ronin/formatting/extensions/text/array.rb",
    "lib/ronin/formatting/extensions/text/string.rb",
    "lib/ronin/formatting/http.rb",
    "lib/ronin/formatting/text.rb",
    "lib/ronin/network.rb",
    "lib/ronin/network/esmtp.rb",
    "lib/ronin/network/extensions.rb",
    "lib/ronin/network/extensions/esmtp.rb",
    "lib/ronin/network/extensions/esmtp/net.rb",
    "lib/ronin/network/extensions/http.rb",
    "lib/ronin/network/extensions/http/net.rb",
    "lib/ronin/network/extensions/imap.rb",
    "lib/ronin/network/extensions/imap/net.rb",
    "lib/ronin/network/extensions/pop3.rb",
    "lib/ronin/network/extensions/pop3/net.rb",
    "lib/ronin/network/extensions/smtp.rb",
    "lib/ronin/network/extensions/smtp/net.rb",
    "lib/ronin/network/extensions/ssl.rb",
    "lib/ronin/network/extensions/ssl/net.rb",
    "lib/ronin/network/extensions/tcp.rb",
    "lib/ronin/network/extensions/tcp/net.rb",
    "lib/ronin/network/extensions/telnet.rb",
    "lib/ronin/network/extensions/telnet/net.rb",
    "lib/ronin/network/extensions/udp.rb",
    "lib/ronin/network/extensions/udp/net.rb",
    "lib/ronin/network/http.rb",
    "lib/ronin/network/http/exceptions.rb",
    "lib/ronin/network/http/exceptions/unknown_request.rb",
    "lib/ronin/network/http/http.rb",
    "lib/ronin/network/http/proxy.rb",
    "lib/ronin/network/imap.rb",
    "lib/ronin/network/network.rb",
    "lib/ronin/network/pop3.rb",
    "lib/ronin/network/smtp.rb",
    "lib/ronin/network/smtp/email.rb",
    "lib/ronin/network/smtp/smtp.rb",
    "lib/ronin/network/ssl.rb",
    "lib/ronin/network/tcp.rb",
    "lib/ronin/network/telnet.rb",
    "lib/ronin/network/udp.rb",
    "lib/ronin/path.rb",
    "lib/ronin/support.rb",
    "lib/ronin/support/version.rb",
    "lib/ronin/templates.rb",
    "lib/ronin/templates/erb.rb",
    "lib/ronin/templates/template.rb",
    "lib/ronin/yard.rb",
    "lib/ronin/yard/extensions.rb",
    "lib/ronin/yard/legacy.rb",
    "lib/ronin/yard/legacy/scanner_handler.rb",
    "lib/ronin/yard/scanner_handler.rb",
    "ronin-support.gemspec",
    "spec/extensions/file_spec.rb",
    "spec/extensions/ip_addr_spec.rb",
    "spec/extensions/kernel_spec.rb",
    "spec/extensions/string_spec.rb",
    "spec/formatting/binary/helpers/hexdumps.rb",
    "spec/formatting/binary/helpers/hexdumps/ascii.bin",
    "spec/formatting/binary/helpers/hexdumps/hexdump_decimal_shorts.txt",
    "spec/formatting/binary/helpers/hexdumps/hexdump_hex_bytes.txt",
    "spec/formatting/binary/helpers/hexdumps/hexdump_hex_shorts.txt",
    "spec/formatting/binary/helpers/hexdumps/hexdump_octal_bytes.txt",
    "spec/formatting/binary/helpers/hexdumps/hexdump_octal_shorts.txt",
    "spec/formatting/binary/helpers/hexdumps/hexdump_repeated.txt",
    "spec/formatting/binary/helpers/hexdumps/od_decimal_bytes.txt",
    "spec/formatting/binary/helpers/hexdumps/od_decimal_ints.txt",
    "spec/formatting/binary/helpers/hexdumps/od_decimal_quads.txt",
    "spec/formatting/binary/helpers/hexdumps/od_decimal_shorts.txt",
    "spec/formatting/binary/helpers/hexdumps/od_hex_bytes.txt",
    "spec/formatting/binary/helpers/hexdumps/od_hex_ints.txt",
    "spec/formatting/binary/helpers/hexdumps/od_hex_quads.txt",
    "spec/formatting/binary/helpers/hexdumps/od_hex_shorts.txt",
    "spec/formatting/binary/helpers/hexdumps/od_octal_bytes.txt",
    "spec/formatting/binary/helpers/hexdumps/od_octal_ints.txt",
    "spec/formatting/binary/helpers/hexdumps/od_octal_quads.txt",
    "spec/formatting/binary/helpers/hexdumps/od_octal_shorts.txt",
    "spec/formatting/binary/helpers/hexdumps/od_repeated.txt",
    "spec/formatting/binary/helpers/hexdumps/repeated.bin",
    "spec/formatting/binary/integer_spec.rb",
    "spec/formatting/binary/string_spec.rb",
    "spec/formatting/digest/string_spec.rb",
    "spec/formatting/http/integer_spec.rb",
    "spec/formatting/http/string_spec.rb",
    "spec/formatting/text/array_spec.rb",
    "spec/formatting/text/string_spec.rb",
    "spec/network/http/http_spec.rb",
    "spec/network/http/proxy_spec.rb",
    "spec/network/network_spec.rb",
    "spec/network/ssl_spec.rb",
    "spec/path_spec.rb",
    "spec/spec_helper.rb",
    "spec/support_spec.rb",
    "spec/templates/classes/example_erb.rb",
    "spec/templates/classes/example_template.rb",
    "spec/templates/erb_spec.rb",
    "spec/templates/helpers/data.rb",
    "spec/templates/helpers/data/includes/_relative.erb",
    "spec/templates/helpers/data/templates/example.erb",
    "spec/templates/template_spec.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/ronin-ruby/ronin-support}
  s.licenses = ["LGPL-2.1"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A support library for Ronin.}
  s.test_files = [
    "spec/extensions/file_spec.rb",
    "spec/extensions/ip_addr_spec.rb",
    "spec/extensions/kernel_spec.rb",
    "spec/extensions/string_spec.rb",
    "spec/formatting/binary/helpers/hexdumps.rb",
    "spec/formatting/binary/integer_spec.rb",
    "spec/formatting/binary/string_spec.rb",
    "spec/formatting/digest/string_spec.rb",
    "spec/formatting/http/integer_spec.rb",
    "spec/formatting/http/string_spec.rb",
    "spec/formatting/text/array_spec.rb",
    "spec/formatting/text/string_spec.rb",
    "spec/network/http/http_spec.rb",
    "spec/network/http/proxy_spec.rb",
    "spec/network/network_spec.rb",
    "spec/network/ssl_spec.rb",
    "spec/path_spec.rb",
    "spec/spec_helper.rb",
    "spec/support_spec.rb",
    "spec/templates/classes/example_erb.rb",
    "spec/templates/classes/example_template.rb",
    "spec/templates/erb_spec.rb",
    "spec/templates/helpers/data.rb",
    "spec/templates/template_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<combinatorics>, ["~> 0.3.0"])
      s.add_runtime_dependency(%q<chars>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<uri-query_params>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<combinatorics>, ["~> 0.3.0"])
      s.add_dependency(%q<chars>, ["~> 0.1.2"])
      s.add_dependency(%q<uri-query_params>, ["~> 0.4.0"])
      s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<combinatorics>, ["~> 0.3.0"])
    s.add_dependency(%q<chars>, ["~> 0.1.2"])
    s.add_dependency(%q<uri-query_params>, ["~> 0.4.0"])
    s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
  end
end

