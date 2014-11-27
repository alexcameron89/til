# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','til','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'til'
  s.version = Til::VERSION
  s.author = 'Alex Kitchens'
  s.email = 'alexcameron98@gmail.com'
  s.homepage = 'http://github.com/alexcameron90'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Creates a Today-I-Learned Journal'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','til.rdoc']
  s.rdoc_options << '--title' << 'til' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'til'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.12.2')
end
