require "fileutils"

Dir.chdir "ext"
ARGV.push "--srcdir=."
Kernel.load("extconf.rb")
ARGV.pop
system("make")
Dir.chdir ".."

require "rbconfig"
$built = (ENV["GEM_ARCH"] || RbConfig::CONFIG["arch"]).sub(/i[3-9]86/, "x86")
$libdir = "lib"
Kernel.load("iseq.gemspec")
Dir.mkdir $libdir unless File.exist?($libdir)
FileUtils.cp "ext/iseq.so", "#{$libdir}/iseq.so"
