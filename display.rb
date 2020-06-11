#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-06-11
#
# class for display data
#

require_relative 'build'
require_relative 'adaptation'

class Display

  SCREEN_WIDTH = 80

  SEPARATOR = '=' * SCREEN_WIDTH + "\n"

  ROOT_DIR = "."

  def initialize

    read_builds

    read_adaptations

  end

private


  def read_builds

    @builds = []

    path = ROOT_DIR + "/build_slot_*"

    directories = Dir[path]

    directories.each do |directory|

      @builds << Build.new(directory)

    end

  end

  def read_adaptations

    @adaps = []

    path = ROOT_DIR + "/adap_slot_*"

    directories = Dir[path]

    directories.each do |directory|

      @adaps << Adaptation.new(directory)

    end

  end


  def max_string_width

    # Entre las variables de instancia de las clases
    # builds y adap (que son todos strings)
    # busco el string con el ancho mayor para formatear
    # la tabla de visualizacion

    widths = []

    [*@builds,*@adaps].each do |object|

      object.instance_variables.each do |variable|

        value = object.instance_variable_get(variable)

        if ! value.empty?

          widths <<  variable.size

        end

      end

    end

    return widths.max

  end

  def to_s

    width = max_string_width

    elements = []

    @builds.each do |build|

      str = ""
      str << "Directory           : " + build.dir_name.ljust(width) + "\n"
      str << "build_name.specific : " + build.build_name.ljust(width) + "\n"

      elements << str

    end

    @adaps.each do |adap|

      str = ""
      str << "Directory           : " + adap.dir_name.ljust(width) + "\n"
      str << "build_name.adap     : " + adap.build_name.ljust(width) + "\n"
      str << "identifier.dms.env  : " + adap.dms_id.ljust(width) + "\n"

      elements << str

    end

    SEPARATOR + elements.join(SEPARATOR) + SEPARATOR

  end

end
