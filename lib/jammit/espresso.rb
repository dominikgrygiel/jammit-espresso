require 'jammit'
require 'jammit/middleware'

# allows use to include jammit/helper without exploding
module ActionView
  class Base
  end
end
require 'jammit/helper'

module Jammit::HelperOverrides
  def javascript_include_tag(*sources)
    script_tag(*sources.flatten)
  end

  def stylesheet_link_tag(*sources)
    style_tag(*sources.flatten)
  end
end

Jammit.load_configuration(Jammit::DEFAULT_CONFIG_PATH, true)

E.send(:include, Jammit)
E.send(:include, Jammit::Helper)
E.send(:include, Jammit::HelperOverrides)

