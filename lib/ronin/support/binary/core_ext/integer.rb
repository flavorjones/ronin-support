#
# Copyright (c) 2006-2022 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of ronin-support.
#
# ronin-support is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-support is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-support.  If not, see <https://www.gnu.org/licenses/>.
#

class Integer

  #
  # Enumerates over every bit flip in the integer.
  #
  # @param [Integer, Range(Integer)] bits
  #   The number of bits to flip or a range of bit indexes to flip.
  #
  # @yield [int]
  #   If a block is given, it will be passed each bit-flipped integer.
  #
  # @yieldparam [Integer] int
  #   The integer but with one of it's bits flipped.
  #
  # @return [Enumerator]
  #   If no block is given, an Enumerator object will be returned.
  #
  # @example bit-flip all eight bits:
  #   0x41.each_bit_flip(8) { |int| puts "%.8b" % int }
  #
  # @example bit-flip bits 8-16:
  #   0xffff.each_bit_flip(8...16) { |int| puts "%.16b" % int }
  #
  # @api public
  #
  def each_bit_flip(bits)
    return enum_for(__method__,bits) unless block_given?

    bits = case bits
           when Range   then bits
           when Integer then (0...bits)
           else
             raise(ArgumentError,"bits must be an Integer or a Range: #{bits.inspect}")
           end

    bits.each do |bit_index|
      mask = 1 << bit_index

      yield self ^ mask
    end
  end

  #
  # Returns every bit flip in the integer.
  #
  # @param [Integer, Range(Integer)] bits
  #   The number of bits to flip or a range of bit indexes to flip.
  #
  # @return [Array<Integer>]
  #   The bit-flipped integers.
  #
  # @example bit-flip all eight bits:
  #   0x41.bit_flips(8)
  #
  # @example bit-flip bits 8-16:
  #   0xffff.bit_flips(8...16)
  #
  # @api public
  #
  def bit_flips(bits)
    each_bit_flip(bits).to_a
  end

  alias flip_bits bit_flips

end
