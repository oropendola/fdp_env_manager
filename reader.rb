#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-06-11
#
# File reader
#

class Reader

  def self.file_content(dir_name, file_name)

     begin

       content = ""

       path = dir_name + "/" + file_name

       content = File.read(path)

     rescue => ex

       puts "Error reading #{path}"

       puts "Exception #{ex}"


     end

     return content.chomp

  end

end
