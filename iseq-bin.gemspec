require "fileutils"

ruby = ENV["TARGET_RUBY"]
Dir.chdir "ext"
system("make clean")
ARGV.push "--srcdir=."
if ruby
  system("#{ruby} extconf.rb")
else
  Kernel.load("extconf.rb")
end
ARGV.pop
system("make")
Dir.chdir ".."

$built = ENV["BUILT_ARCH"]
ver = RUBY_VERSION
if ruby
  $built ||= `#{ruby} -rrbconfig -e 'print RbConfig::CONFIG["arch"]'`
  ver = `#{ruby} -e 'print RUBY_VERSION'`
else
  require "rbconfig"
  $built ||= RbConfig::CONFIG["arch"]
end
$built = $built.sub(/i[3-9]86/, "x86")
$built = Gem::Platform.new($built)
$built.version = ver # if ver < "1.9.2"
$libdir = "lib"
Kernel.load("iseq.gemspec")
Dir.mkdir $libdir unless File.exist?($libdir)
FileUtils.cp "ext/iseq.so", "#{$libdir}/iseq.so"
