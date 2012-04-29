require 'spec_helper'
require 'network/shared/unix_server'
require 'ronin/network/unix'

require 'fileutils'

describe Network::UNIX do
  describe "helper methods", :network do
    subject do
      obj = Object.new
      obj.extend described_class
      obj
    end

    describe "#unix_open?" do
      include_context "UNIX Server"

      let(:old_path) { socket_path('ronin_old_unix_socket') }
      let(:bad_path) { socket_path('ronin_bad_unix_socket') }

      before(:all) { UNIXServer.new(old_path).close }

      it "should return true for listening UNIX sockets" do
        subject.unix_open?(path).should == true
      end

      it "should return false for closed UNIX sockets" do
        subject.unix_open?(old_path).should == false
      end

      it "should have a timeout for non-existent UNIX sockets" do
        timeout = 2

        t1 = Time.now
        subject.unix_open?(bad_path,timeout)
        t2 = Time.now

        (t2 - t1).to_i.should <= timeout
      end

      after(:all) { FileUtils.rm(old_path) }
    end

    describe "#unix_connect" do
      include_context "UNIX Server"

      it "should open a UNIXSocket" do
        socket = subject.unix_connect(path)

        socket.should be_kind_of(UNIXSocket)
        socket.should_not be_closed

        socket.close
      end

      it "should yield the new UNIXSocket" do
        socket = nil

        subject.unix_connect(path) do |yielded_socket|
          socket = yielded_socket
        end

        socket.should_not be_closed
        socket.close
      end
    end

    describe "#unix_connect_and_send" do
      include_context "UNIX Server"

      let(:data) { "HELO ronin\n" }

      it "should connect and then send data" do
        socket   = subject.unix_connect_and_send(data,path)
        response = socket.readline

        response.should == data

        socket.close
       end

      it "should yield the UNIXSocket" do
        response = nil

        socket = subject.unix_connect_and_send(data,path) do |socket|
          response = socket.readline
        end

        response.should == data

        socket.close
      end
    end

    describe "#unix_session" do
      include_context "UNIX Server"

      it "should open then close a UNIXSocket" do
        socket = nil

        subject.unix_session(path) do |yielded_socket|
          socket = yielded_socket
        end

        socket.should be_kind_of(UNIXSocket)
        socket.should be_closed
      end
    end
  end
end
