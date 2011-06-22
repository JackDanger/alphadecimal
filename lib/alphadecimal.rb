# coding: utf-8

module Alphadecimal
  def self.char(str)
    str.respond_to?(:ord) ? str.ord : str[0]
  end

  B62_0, B62_9 = char('0'), char('9')
  B62_A, B62_Z = char('A'), char('Z')
  B62_a, B62_z = char('a'), char('z')
  B62_CHRS = [(B62_0..B62_9).map{|i|i}, (B62_A..B62_Z).map{|i|i}, (B62_a..B62_z).map{|i|i}].flatten

  module Number
    def alphadecimal
      return self if nil? || self < 0
      return to_s if self == 0
      string = ""
      value = self
      until value == 0
        case mod = value % 62
        when 0..9 then string << (mod + B62_0)
        when 10..35 then string << (mod - 10 + B62_A)
        when 36...62 then string << (mod - 36 + B62_a)
        end
        value = value / 62
      end
      string.reverse
    end
  end
  
  module String
    def alphadecimal
      return self unless is_alphadecimal?
      val = 0
      key = reverse
      key.bytes.each_with_index do |char, i|
         case
         when (B62_0..B62_9).include?(char) then norm = char - B62_0
         when (B62_A..B62_Z).include?(char) then norm = char - B62_A + 10
         when (B62_a..B62_z).include?(char) then norm = char - B62_a + 36
         end
        val = val + (norm * (62 ** i))
      end
      val
    end
    
    def is_alphadecimal?
      return false if nil?
      string = dup
      return false if string.length <= 0
      string.bytes.to_a.each do |b|
        return false unless B62_CHRS.include?(b)
      end
      true
    end
  end
end

class String
  include Alphadecimal::String
end
class Fixnum
  include Alphadecimal::Number
end
class Bignum
  include Alphadecimal::Number
end
