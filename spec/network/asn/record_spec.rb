require 'spec_helper'
require 'ronin/support/network/asn/record'
require 'ronin/support/network/ip_range/cidr'

describe Ronin::Support::Network::ASN::Record do
  let(:number)       { 3356 }
  let(:cidr)         { '4.0.0.0/9' }
  let(:range)        { Ronin::Support::Network::IPRange::CIDR.new(cidr) }
  let(:country_code) { 'US'     }
  let(:name)         { 'LEVEL3' }

  subject { described_class.new(number,range,country_code,name) }

  describe "#initialize" do
    it "must set #number" do
      expect(subject.number).to eq(number)
    end

    it "must set #range" do
      expect(subject.range).to eq(range)
    end

    it "must set #country_code" do
      expect(subject.country_code).to eq(country_code)
    end

    it "must set #name" do
      expect(subject.name).to eq(name)
    end
  end

  describe "#routed?" do
    context "when #country_code and #name are not nil" do
      it "must return true" do
        expect(subject.routed?).to be(true)
      end
    end

    context "but when #country_code and #name are nil" do
      let(:country_code) { nil }
      let(:name)         { nil }

      it "must return false" do
        expect(subject.routed?).to be(false)
      end
    end
  end

  describe "#not_routed?" do
    context "when #country_code and #name are nil" do
      let(:country_code) { nil }
      let(:name)         { nil }

      it "must return true" do
        expect(subject.not_routed?).to be(true)
      end
    end

    context "but when #country_code and #name are not nil" do
      it "must return false" do
        expect(subject.not_routed?).to be(false)
      end
    end
  end

  describe "#include?" do
    context "when the given IP address belongs to the range" do
      let(:ip) { '4.4.4.4' }

      it "must return true" do
        expect(subject.include?(ip)).to be(true)
      end
    end

    context "when the given IP address does not belong to the range" do
      let(:ip) { '1.1.1.1' }

      it "must return false" do
        expect(subject.include?(ip)).to be(false)
      end
    end
  end

  describe "#each" do
    let(:range) { Ronin::Support::Network::IPRange::CIDR.new('1.1.1.1/24') }

    context "whne given a block" do
      it "must enumerate over every IP address in the range" do
        expect { |b|
          subject.each(&b)
        }.to yield_successive_args(*range.each.to_a)
      end
    end

    context "when not given a block" do
      it "must return an Enumerator for the #each method" do
        expect(subject.each.to_a).to eq(range.each.to_a)
      end
    end
  end
end
