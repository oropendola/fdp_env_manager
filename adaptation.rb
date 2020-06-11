#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-06-11
#
# Class related to adaptacion
#

require_relative 'reader'

class Adaptation

  attr_reader :dir_name, :build_name, :dms_id

  def initialize(dir_name)

     @dir_name = dir_name

     @build_name = Reader.file_content(dir_name, "build_name.adap")

     @dms_id = Reader.file_content(dir_name, "identification.dms.txt")

  end

end
