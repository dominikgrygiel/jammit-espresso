require 'jammit'
require 'jammit/middleware'

# allows use to include jammit/helper without exploding
module ActionView
  class Base
  end
end
require 'jammit/helper'

module Jammit::HelperOverrides

private
  def javascript_include_tag(*sources)
    script_tag(*append_last_midified(*sources.flatten))
  end

  def stylesheet_link_tag(*sources)
    style_tag(*append_last_midified(*sources.flatten))
  end

  def append_last_midified(path, options = {})
    [path.gsub(/(\.[a-z]+)/i, "-#{public_last_modified(path)}#{'\1'}"), options]
  end

  def public_last_modified(path)
    if File.exists?(f = File.join(Jammit::Middleware::PUBLIC_ROOT, path))
      File.mtime(f).to_i
    else
      @public_last_modified ||= Dir["#{Jammit::Middleware::PUBLIC_ROOT}/**/*"].map{ |f| File.mtime(f) }.max.to_i
    end
  end
end

Jammit.load_configuration(Jammit::DEFAULT_CONFIG_PATH, true)

E.send(:include, Jammit)
E.send(:include, Jammit::Helper)
E.send(:include, Jammit::HelperOverrides)

