require 'spec_helper'
require 'ronin/extensions/string'

describe String do
  describe "each_substring" do
    before(:all) do
      @string = 'hello'
    end

    it "should enumerate over each sub-string within the String" do
      @string.each_substring do |sub_string|
        @string.should include(sub_string)
      end
    end

    it "should allow passing the string index back" do
      @string.each_substring do |sub_string,index|
        @string[index,sub_string.length].should == sub_string

        @string.should include(sub_string)
      end
    end

    it "should enumerate over each sub-string of a minimum length" do
      @string.each_substring(2) do |sub_string|
        sub_string.length.should >= 2

        @string.should include(sub_string)
      end
    end

    it "should return an Enumerator when no block is given" do
      @string.each_substring.all? { |sub_string|
        @string.include?(sub_string)
      }.should == true
    end
  end

  describe "each_unique_substring" do
    before(:all) do
      @string = 'abablol'
    end

    before(:each) do
      @seen = []
    end

    it "should enumerate over each unique sub-string within the String" do
      @string.each_unique_substring do |sub_string|
        @string.should include(sub_string)

        @seen << sub_string
      end

      @seen.uniq.should == @seen
    end

    it "should enumerate over each sub-string of a minimum length" do
      @string.each_unique_substring(2) do |sub_string|
        sub_string.length.should >= 2
        @string.should include(sub_string)

        @seen << sub_string
      end

      @seen.uniq.should == @seen
    end

    it "should return an Enumerator when no block is given" do
      @seen = @string.each_unique_substring.to_a

      @seen.all? { |sub_string|
        @string.include?(sub_string)
      }.should == true

      @seen.uniq.should == @seen
    end
  end

  describe "common_prefix" do
    it "should find the common prefix between two Strings" do
      one = 'What is puzzling you is the nature of my game'
      two = 'What is puzzling you is the nature of my name'
      common = 'What is puzzling you is the nature of my '

      one.common_prefix(two).should == common
    end

    it "should return the common prefix between two Strings with no uncommon postfix" do
      one = "1234"
      two = "12345"
      common = "1234"

      one.common_prefix(two).should == common
    end

    it "should return an empty String if there is no common prefix" do
      one = 'Tell me people'
      two = 'Whats my name'

      one.common_prefix(two).should == ''
    end

    it "should return an empty String if one of the strings is also empty" do
      one = 'Haha'
      two = ''

      one.common_prefix(two).should == ''
    end
  end

  describe "common_postfix" do
    it "should find the common postfix between two Strings" do
      one = 'Tell me baby whats my name'
      two = "Can't you guess my name"
      common = 's my name'

      one.common_postfix(two).should == common
    end

    it "should return an empty String if there is no common postfix" do
      one = 'You got to right up, stand up'
      two = 'stand up for your rights'

      one.common_postfix(two).should == ''
    end

    it "should return an empty String if one of the strings is also empty" do
      one = 'You and I must fight for our rights'
      two = ''

      one.common_postfix(two).should == ''
    end
  end

  describe "uncommon_substring" do
    it "should find the uncommon substring between two Strings" do
      one = "Tell me baby whats my name"
      two = "Tell me honey whats my name"
      uncommon = 'bab'

      one.uncommon_substring(two).should == uncommon
    end

    it "should find the uncommon substring between two Strings with a common prefix" do
      one = 'You and I must fight for our rights'
      two = 'You and I must fight to survive'
      uncommon = 'for our rights'

      one.uncommon_substring(two).should == uncommon
    end

    it "should find the uncommon substring between two Strings with a common postfix" do
      one = 'Tell me baby whats my name'
      two = "Can't you guess my name"
      uncommon = 'Tell me baby what'

      one.uncommon_substring(two).should == uncommon
    end
  end

  it "should dump printable strings" do
    "hello".dump.should == '"hello"'
  end

  it "should dump strings containing control characters" do
    "hello\n\b\a".dump.should == '"hello\n\b\a"'
  end

  it "should dump strings containing non-printable characters" do
    "hello\x90\x05\xef".dump.should == '"hello\x90\x05\xef"'
  end

  it "should dump the string when calling the inspect method" do
    "hello\x90\x05\xef".inspect.should == '"hello\x90\x05\xef"'
  end
end
