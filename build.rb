#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-06-11
#
# Class related to build slot
#

require_relative 'reader'

class Build

  attr_reader :dir_name, :build_name

  def initialize(dir_name)

     @dir_name = dir_name

     @build_name = Reader.file_content(dir_name, "build_name.specific")

  end


end
