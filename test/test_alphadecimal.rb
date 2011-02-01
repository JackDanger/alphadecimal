# coding: utf-8

require 'test/unit'
require File.dirname(__FILE__) + "/../lib/alphadecimal"

class TestAlphadecimal < Test::Unit::TestCase

  include Alphadecimal
  
  def test_fixnum_becomes_string
    assert_kind_of String, 45.alphadecimal
  end
  
  def test_bignum_becomes_string
    assert_kind_of String, 231087934571049032.alphadecimal
  end
  
  def test_string_becomes_bignum
    assert_kind_of Bignum, 'aHealk43JZy'.alphadecimal
  end
  
  def test_string_becomes_fixnum
    assert_kind_of Fixnum, 'j'.alphadecimal
  end
  
  def test_invalid_string_returns_self
    string = 'Whoah there!'
    assert_equal string, string.alphadecimal
  end
  
  def test_identities
    [123, 90000008, 733, '12331', 'abYzj', '0', 'A', 'z',
     79823898923232, 'ZZZZZZZZZZZZZZZZZZZ', 'Yz82J3Ng5Nj9M1',
     '!!!', '@$%!^', 'abc ', 'HP', 4, 'ǟ'].each do |object|
      assert_equal object, object.alphadecimal.alphadecimal
    end
  end

  def test_alphabet_characters_should_only_validate
    alphabet = (('0'.bytes.first..'9'.bytes.first).map{|i|i} + 
                ('A'.bytes.first..'Z'.bytes.first).map{|i|i} +
                ('a'.bytes.first..'z'.bytes.first).map{|i|i}).flatten
    (0..255).each do |i|
      if alphabet.include?(i)
         assert i.chr.is_alphadecimal?, "char #{i} is not valid as string #{i.chr}"
      else
         assert !i.chr.is_alphadecimal?, "char #{i} is valid as string #{i.chr}"
      end
    end 
  end

  def test_edge_62_to_the_0_convertions_should_be_valid
    (0...62).each do |i|
      encode = i.alphadecimal
      decode = encode.alphadecimal
      assert_equal i, decode, "integer #{i.inspect} was encoded as #{encode.inspect} and was decoded to #{decode.inspect}"
    end
  end

  def test_edge_62_to_the_n_convertions_should_be_valid
    (0...3).each do |p|
      n = 62 ** p
      (0...62).each do |i|
        encode = (i+n).alphadecimal
        decode = encode.alphadecimal
        assert_equal i+n, decode, "interger #{i+n} was encoded as #{encode} and was decoded to #{decode}"
      end
    end
  end
end
