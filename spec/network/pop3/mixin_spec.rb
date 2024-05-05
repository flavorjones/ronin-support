require 'spec_helper'
require 'ronin/support/network/pop3/mixin'

describe Ronin::Support::Network::POP3::Mixin do
  subject do
    obj = Object.new
    obj.extend described_class
    obj
  end

  let(:host) { 'pop.gmail.com' }
  let(:port) { 995 }

  describe "#pop3_connect" do
    context "integration", :network do
      it "must return a Net::POP3 object" do
        pending "need valid POP3 credentials"

        pop3 = subject.pop3_connect(host, port: port, ssl: true)

        expect(pop3).to be_kind_of(Net::POP3)
        pop3.finish
      end

      it "must connect to an POP3 service" do
        pending "need valid POP3 credentials"
        pop3 = subject.pop3_connect(host, port: port, ssl: true)

        expect(pop3).to be_started
        pop3.finish
      end

      context "when the hostname is a unicode hostname" do
        let(:host) { "www.詹姆斯.com" }

        pending "need to find a POP3 server with a unicode domain" do
          it "must connect to the punycode version of the unicode domain" do
            pop3 = subject.pop3_connect(host, port: port, ssl: true)

            expect(pop3).to be_kind_of(Net::IMAP)

            pop3.close
            pop3.disconnect
          end
        end
      end

      context "when given a block" do
        it "must yield a new Net::POP3 object" do
          pending "need valid POP3 credentials"

          yielded_pop3 = nil

          subject.pop3_connect(host, port: port, ssl: true) do |pop3|
            yielded_pop3 = pop3
          end

          expect(yielded_pop3).to be_kind_of(Net::POP3)
        end

        it "must return the block's return value" do
          pending "need valid POP3 credentials"

          returned_value = subject.pop3_connect(host, port: port, ssl: true) do |pop3|
            :return_value
          end

          expect(returned_value).to be(:return_value)
        end

        it "must finish the POP3 session after yielding it" do
          pending "need valid POP3 credentials"

          pop3        = nil
          was_started = nil

          subject.pop3_connect(host, port: port, ssl: true) do |yielded_pop3|
            pop3        = yielded_pop3
            was_started = pop3.started?
          end

          expect(was_started).to be(true)
          expect(pop3).to_not be_started
        end

        context "when the block raises an exception" do
          it "must finish the POP3 session after yielding it" do
            pending "need valid POP3 credentials"

            pop3        = nil
            was_started = nil

            expect do
              subject.pop3_connect(host, port: port, ssl: true) do |yielded_pop3|
                pop3        = yielded_pop3
                was_started = pop3.started?
                raise "test exception"
              end
            end.to raise_error("test exception")

            expect(was_started).to be(true)
            expect(pop3).to_not be_started
          end
        end
      end
    end
  end
end
