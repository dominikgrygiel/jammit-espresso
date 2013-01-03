Gem::Specification.new do |s|
  s.name      = 'jammit-espresso'
  s.version   = '0.0.1'

  s.homepage    = "http://documentcloud.github.com/jammit/"
  s.summary     = "Industrial Strength Asset Packaging for Espresso"
  s.description = <<-EOS
    Jammit is an industrial strength asset packaging library for Espresso,
    providing both the CSS and JavaScript concatenation and compression that
    you'd expect, as well as YUI Compressor and Closure Compiler compatibility,
    ahead-of-time gzipping, built-in JavaScript template support, and optional
    Data-URI / MHTML image embedding.
  EOS

  s.authors           = ['Dominik Grygiel']
  s.email             = 'dominik.grygiel@gmail.com'

  s.require_paths     = ['lib']

  s.add_dependency 'jammit', '>= 0.6.0'

  s.files = Dir['lib/**/*', 'jammit-espresso.gemspec', 'README.md']
end

