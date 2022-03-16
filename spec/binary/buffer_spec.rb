require 'spec_helper'
require 'ronin/support/binary/buffer'

describe Ronin::Support::Binary::Buffer do
  let(:length) { 10 }

  describe "#initialize" do
    subject { described_class.new(length) }

    it "must default #endian to nil" do
      expect(subject.endian).to be(nil)
    end

    context "when the endian: keyword argument is given" do
      let(:endian) { :little }

      subject { described_class.new(length, endian: endian) }

      it "must set #endian" do
        expect(subject.endian).to be(endian)
      end

      it "must set #type_system to the Ronin::Support::Binary::Types:: module" do
        expect(subject.type_system).to be(Ronin::Support::Binary::Types.endian(endian))
      end
    end

    it "must default #arch to nil" do
      expect(subject.arch).to be(nil)
    end

    context "when the arch: keyword argument is given" do
      let(:arch) { :x86 }

      subject { described_class.new(length, arch: arch) }

      it "must set #arch" do
        expect(subject.arch).to be(arch)
      end

      it "must set #type_system to the Ronin::Support::Binary::Types::Arch:: module" do
        expect(subject.type_system).to be(Ronin::Support::Binary::Types::Arch[arch])
      end
    end

    it "must default #type_system to Ronin::Support::Binary::Types" do
      expect(subject.type_system).to be(Ronin::Support::Binary::Types)
    end

    it "must default #type to Ronin::Support::Binary::Types::Byte" do
      expect(subject.type).to be(Ronin::Support::Binary::Types::Byte)
    end

    it "must set #length" do
      expect(subject.length).to eq(length)
    end

    it "must set #size to #length" do
      expect(subject.size).to eq(length)
    end

    it "must initialize #string with Encoding::ASCII_8BIT" do
      expect(subject.string.encoding).to be(Encoding::ASCII_8BIT)
    end

    it "must initialize #string to length of #size" do
      expect(subject.string.bytesize).to eq(subject.size)
    end

    it "must initialize #string to all null-bytes" do
      expect(subject.string).to eq("\0" * subject.size)
    end

    context "when a type argument is given" do
      let(:type_name) { :char }
      let(:type)      { Ronin::Support::Binary::Types[type_name] }

      subject { described_class.new(type_name,length) }

      it "must set #type" do
        expect(subject.type).to eq(type)
      end

      context "and the type is a multi-byte type" do
        let(:type_name) { :uint32_le }

        it "must set #size to length * type.size" do
          expect(subject.size).to eq(length * type.size)
        end
      end
    end

    context "when a String argument is given instead of a length argument" do
      let(:string) { "A" * length }

      subject { described_class.new(string) }

      it "must set #string to the given string value" do
        expect(subject.string).to be(string)
      end

      it "must set #size to the string's byte size" do
        expect(subject.size).to eq(string.bytesize)
      end

      it "must set #length to the string's byte size" do
        expect(subject.length).to eq(string.bytesize)
      end

      context "and when a type argument is given" do
        let(:type_name) { :uint32_le }
        let(:type)      { Ronin::Support::Binary::Types[type_name] }

        subject { described_class.new(type_name,string) }

        it "must set #type" do
          expect(subject.type).to eq(type)
        end

        it "must set #length to string.bytesize / type.size" do
          expect(subject.length).to eq(string.bytesize / type.size)
        end
      end
    end

    context "when not given a length or a string argument" do
      let(:arg) { :foo }

      it do
        expect {
          described_class.new(arg)
        }.to raise_error(ArgumentError,"argument must be either a length (Integer) or a buffer (String): #{arg.inspect}")
      end
    end
  end

  subject { described_class.new(length) }

  describe "#[]" do
    context "when the index has not been previously written to" do
      it "must decode a 0 value" do
        expect(subject[1]).to eq(0)
      end

      context "and when #type is a multi-byte type" do
        let(:type) { :uint32_le }

        subject { described_class.new(type,length) }

        it "must decode a 0 value" do
          expect(subject[1]).to eq(0)
        end
      end
    end

    context "when the index has been previously written to" do
      let(:index) { 1  }
      let(:value) { 42 }

      before { subject[index] = value }

      it "must decode the previously written value" do
        expect(subject[index]).to eq(value)
      end

      context "and when #type is a multi-byte type" do
        let(:type)  { :uint32_le }
        let(:value) { 0x11223344 }

        subject { described_class.new(type,length) }

        it "must decode the previously written multi-byte value" do
          expect(subject[index]).to eq(value)
        end
      end
    end
  end

  describe "#[]=" do
    let(:index) { 1    }
    let(:value) { 0x41 }

    before { subject[index] = value }

    it "must write the byte value to the given index within #string" do
      expect(subject.string[index]).to eq(value.chr)
    end

    context "and when #type is a multi-byte type" do
      let(:type)  { :uint32_le }
      let(:value) { 0x11223344 }

      subject { described_class.new(type,length) }

      it "must write the multi-byte value to the given index within #string" do
        offset = index*subject.type.size
        size   = subject.type.size

        packed_value = subject.type.pack(value)

        expect(subject.string[offset,size]).to eq(packed_value)
      end
    end
  end

  describe "#get" do
    let(:type_name) { :int32_le }
    let(:offset)    { 1  }
    let(:value)     { -1 }

    before do
      subject[1] = 0xff
      subject[2] = 0xff
      subject[3] = 0xff
      subject[4] = 0xff
    end

    it "must read and decode a value at the given offset with the given type" do
      expect(subject.get(type_name,offset)).to eq(value)
    end
  end

  describe "#put" do
    let(:type_name) { :int32_le }
    let(:type)      { Ronin::Support::Binary::Types[type_name] }
    let(:offset)    { 1 }
    let(:value)     { -1 }

    let(:packed_value) { type.pack(value) }

    it "must write the given value at the given offset with the given type" do
      subject.put(type_name,offset,value)

      expect(subject.string[offset,type.size]).to eq(packed_value)
    end
  end

  describe "#to_s" do
    it "must return #string" do
      expect(subject.to_s).to be(subject.string)
    end
  end

  describe "#to_str" do
    it "must return #string" do
      expect(subject.to_str).to be(subject.string)
    end
  end
end
