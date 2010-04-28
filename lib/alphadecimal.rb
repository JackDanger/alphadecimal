module Alphadecimal
  B62_0, B62_9 = '0'[0], '9'[0]
  B62_A, B62_Z = 'A'[0], 'Z'[0]
  B62_a, B62_z = 'a'[0], 'z'[0]
  B62_CHRS = [(B62_0..B62_9).map, (B62_A..B62_Z).map,  (B62_a..B62_z).map].flatten

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
      (0...key.size).each do |i|
         char = key[i]
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
      string = self.dup
      return false if string.length <= 0
      (0...string.size).each do |i|
        return false unless B62_CHRS.include?(string[i])
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
