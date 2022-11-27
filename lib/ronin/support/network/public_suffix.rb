#
# Copyright (c) 2006-2022 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'ronin/support/network/public_suffix/list'

module Ronin
  module Support
    module Network
      module PublicSuffix
        #
        # Downloads/updates then loads the cached file
        # (`~/.cache/ronin/ronin-support/public_suffix_list.dat`).
        #
        # @return [List]
        #   The loaded list file.
        #
        def self.list
          @list ||= (
            List.update
            List.load_file
          )
        end
      end
    end
  end
end
