#
# Copyright (c) 2006-2012 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of Ronin Support.
#
# Ronin Support is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ronin Support is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Ronin Support.  If not, see <http://www.gnu.org/licenses/>.
#

require 'ronin/support/crypto/cipher/aes'

module Ronin
  module Support
    module Crypto
      class Cipher < OpenSSL::Cipher
        class AES128 < AES

          #
          # Initializes the AES 128bit cipher.
          #
          # @param [:cbc, :cfb, :ofb, :ctr, Symbol] mode
          #   The desired AES cipher mode.
          #
          # @param [Hash{Symbol => Object}] kwargs
          #   Additional keyword arguments for {Cipher#initialize}.
          #
          def initialize(mode=:cbc,**kwargs)
            super(128,mode,**kwargs)
          end

          #
          # The list of supported AES 128bit ciphers.
          #
          # @return [Array<String>]
          #   The list of supported AES 128bit cipher names.
          #
          def self.supported
            super().grep(/^aes[-]?128/)
          end

        end
      end
    end
  end
end
