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

require 'ronin/support/network/dns/resolver'

require 'resolv'

module Ronin
  module Support
    module Network
      #
      # @since 0.4.0
      #
      module DNS
        #
        # The primary DNS nameserver(s) to query.
        #
        # @return [Array<String>]
        #   The addresses of the nameservers.
        #
        # @api public
        #
        def self.nameservers
          @nameservers ||= Resolver.default_nameservers
        end

        #
        # Sets the DNS nameserver to be queried.
        #
        # @param [Array<String>, String] new_nameservers
        #   The addresses of the new nameservers.
        #
        # @return [Array<String>]
        #   The addresses of the new nameservers.
        #
        # @api public
        #
        def self.nameservers=(new_nameservers)
          @nameservers = Array(new_nameservers).map(&:to_s)
          @resolver    = Resolver.new(@nameservers)
          return new_nameservers
        end

        #
        # Creates a DNS Resolver for the given nameserver(s).
        #
        # @param [Array<String>, String, nil] nameservers
        #   Optional DNS nameserver(s) to query.
        #
        # @return [Resolver]
        #   The DNS Resolver.
        #
        # @api public
        #
        # @since 0.6.0
        #
        def self.resolver(nameservers=nil)
          if nameservers
            Resolver.new(Array(nameservers).map(&:to_s))
          else
            @resolver ||= Resolver.new(self.nameservers)
          end
        end
      end
    end
  end
end
