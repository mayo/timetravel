require 'rubygems'
require 'spec'
require 'rake/clean'
require 'rake/gempackagetask'
require 'spec/rake/spectask'
require 'pathname'

CLEAN.include '{pkg}/'

spec = Gem::Specification.new do |s|
  s.name             = 'timetravel'
  s.version          = '0.1.0'
  s.platform         = Gem::Platform::RUBY
  s.has_rdoc         = false
  s.extra_rdoc_files = %w[ README LICENSE TODO ]
  s.summary          = 'Gem that makes working with intervals easier'
  s.description      = s.summary
  s.author           = 'Mayo Jordanov'
  s.email            = 'mayo@oyam.ca'
  s.homepage         = 'http://github.com/mayo/timetravel'
  s.require_path     = 'lib'
  s.files            = FileList[ '{lib,spec}/**/*.rb', 'spec/spec.opts', 'Rakefile', *s.extra_rdoc_files ]
end

task :default => [ :spec ]

WIN32 = (PLATFORM =~ /win32|cygwin/) rescue nil
SUDO  = WIN32 ? '' : ('sudo' unless ENV['SUDOLESS'])

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install #{spec.name} #{spec.version}"
task :install => [ :package ] do
  sh "#{SUDO} gem install pkg/#{spec.name}-#{spec.version} --no-update-sources", :verbose => false
end

desc 'Run specifications'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts << '--options' << 'spec/spec.opts' if File.exists?('spec/spec.opts')
  t.spec_files = Pathname.glob(Pathname.new(__FILE__).dirname + 'spec/**/*_spec.rb')
end
